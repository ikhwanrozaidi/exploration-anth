import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/repository/daily_report_repository.dart';
import '../datasources/daily_report_image_remote_datasource.dart';
import '../datasources/daily_report_local_datasource.dart';
import '../datasources/daily_report_remote_datasource.dart';
import '../models/create_daily_report_model.dart';
import '../models/daily_report_model.dart';

@Injectable(as: DailyReportRepository)
class DailyReportRepositoryImpl
    extends BaseOfflineSyncRepository<List<DailyReport>, List<DailyReportModel>>
    implements DailyReportRepository {
  final DailyReportRemoteDataSource _remoteDataSource;
  final DailyReportLocalDataSource _localDataSource;
  final ImageLocalDataSource _imageLocalDataSource;
  final DailyReportImageRemoteDataSource _imageRemoteDataSource;

  DailyReportRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    DatabaseService databaseService,
    this._imageLocalDataSource,
    this._imageRemoteDataSource,
  ) : super(
          databaseService: databaseService,
          imageLocalDataSource: _imageLocalDataSource,
        );

  @override
  Future<Either<Failure, List<DailyReport>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    final remoteResult = await _remoteDataSource.getDailyReports(
      companyUID: companyUID,
      page: page,
      limit: limit,
      sortOrder: sortOrder,
      search: search,
    );

    return remoteResult.fold(
      (failure) async {
        // Offline-first: fallback to local data source on remote failure
        final localReports = await _localDataSource.getCachedDailyReports(
          companyUID,
          search,
        );

        if (localReports != null && localReports.isNotEmpty) {
          return Right(localReports.map((model) => model.toEntity()).toList());
        }

        return Left(failure);
      },
      (models) async {
        await _localDataSource.cacheDailyReports(models);

        return Right(models.map((model) => model.toEntity()).toList());
      },
    );
  }

  @override
  Future<Either<Failure, DailyReport>> getDailyReportById({
    required String companyUID,
    required String dailyReportUID,
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from cache first if not forcing refresh
      if (!forceRefresh) {
        final cachedReport = await _localDataSource.getCachedDailyReportByUid(dailyReportUID);
        if (cachedReport != null) {
          return Right(cachedReport.toEntity());
        }
      }

      // Fetch from remote
      final remoteResult = await _remoteDataSource.getDailyReportById(
        companyUID: companyUID,
        dailyReportUID: dailyReportUID,
      );

      return remoteResult.fold(
        (failure) async {
          // On failure, try cache as fallback
          final cachedReport = await _localDataSource.getCachedDailyReportByUid(dailyReportUID);
          if (cachedReport != null) {
            return Right(cachedReport.toEntity());
          }
          return Left(failure);
        },
        (model) async {
          // Cache the fetched model
          await _localDataSource.cacheSingleDailyReport(model);
          return Right(model.toEntity());
        },
      );
    } catch (e) {
      return Left(CacheFailure('Failed to get daily report: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  @override
  Future<Either<Failure, DailyReport>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
    Map<ImageContextField, List<String>>? images, // Optional images parameter
    String? adminUID, // Admin UID for image upload tracking
  }) async {
    try {
      // Use base class executeOptimistic with automatic SyncQueue fallback
      return await executeOptimistic<DailyReport, DailyReportModel>(
        local: () async {
          // Step 1: Create locally with temp UID (inside callback)
          final localReport = await _localDataSource.createDailyReportLocal(
            data,
            companyUID,
          );

          // Step 2: Save images to sync queue if provided
          print('💾 Checking image save conditions: images=${images != null ? "not null (${images.length} fields)" : "null"}, adminUID=${adminUID ?? "null"}');
          if (images != null && images.isNotEmpty && adminUID != null) {
            print('💾 Saving ${images.length} image fields to sync queue...');
            await saveImagesForEntity(
              entityType: SyncEntityType.dailyReport,
              entityUID: localReport.uid, // temp UID
              companyUID: companyUID,
              uploadedByUID: adminUID,
              imagesByContextField: images,
            );
          } else {
            print('⚠️ Skipping image save: conditions not met');
          }

          return localReport.toEntity();
        },
        remote: () => _remoteDataSource.createDailyReport(
          data: data,
          companyUID: companyUID,
        ),
        onSyncSuccess: (serverModel, tempUID) async {
          // Update local DB with server data (replaces temp UID with server UID)
          await _localDataSource.updateReportWithServerData(
            tempUID, // Temp UID automatically extracted and provided by base class
            serverModel,
          );

          // Activate images for upload if they exist
          if (images != null && images.isNotEmpty) {
            await activateImageUpload(
              SyncEntityType.dailyReport,
              tempUID, // Old temp UID
              serverModel.uid, // New server UID
            );

            // Try uploading images immediately (fire-and-forget)
            // If it fails, images will retry via periodic sync
            _uploadImagesImmediately(companyUID, serverModel.uid);
          }
        },
        entityType: SyncEntityType.dailyReport,
        action: SyncAction.create,
        payload: {...data.toJson(), 'companyUID': companyUID},
        priority: 10,
      );
    } catch (e) {
      return Left(CacheFailure('Failed to create report locally: $e'));
    }
  }

  /// Upload images immediately after report sync
  /// This is a fire-and-forget operation - if it fails, images stay in queue for retry
  Future<void> _uploadImagesImmediately(
    String companyUID,
    String dailyReportUID,
  ) async {
    try {
      print('📤 Attempting immediate image upload for $dailyReportUID...');

      // Get activated images for this report
      final images = await _imageLocalDataSource.getImagesByEntity(
        entityType: SyncEntityType.dailyReport,
        entityUID: dailyReportUID,
      );

      if (images.isEmpty) {
        print('ℹ️ No images to upload for report $dailyReportUID');
        return;
      }

      print('📤 Uploading ${images.length} images immediately...');

      // Attempt upload
      final result = await _imageRemoteDataSource.uploadImagesForReport(
        companyUID: companyUID,
        dailyReportUID: dailyReportUID,
        images: images,
      );

      await result.fold(
        (failure) async {
          print('⚠️ Immediate image upload failed: ${failure.message}');
          print('   Images will retry via periodic sync');

          // Increment retry count for all images
          await _imageLocalDataSource.incrementRetryCount(
            SyncEntityType.dailyReport,
            dailyReportUID,
            failure.message,
          );
        },
        (uploadedFiles) async {
          print('✅ Immediate upload successful! ${uploadedFiles.length} images uploaded');

          // Mark images as synced with server metadata
          await _imageLocalDataSource.markImagesAsSynced(
            SyncEntityType.dailyReport,
            dailyReportUID,
            uploadedFiles,
          );
        },
      );
    } catch (e) {
      print('❌ Error in immediate image upload: $e');
      print('   Images will retry via periodic sync');

      // Increment retry count on exception
      await _imageLocalDataSource.incrementRetryCount(
        SyncEntityType.dailyReport,
        dailyReportUID,
        e.toString(),
      );
    }
  }
}
