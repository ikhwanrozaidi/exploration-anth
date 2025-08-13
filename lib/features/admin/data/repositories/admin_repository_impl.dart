import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../../domain/entities/admin.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_local_data_source.dart';
import '../datasources/admin_remote_data_source.dart';

@LazySingleton(as: AdminRepository)
class AdminRepositoryImpl implements AdminRepository {
  final AdminLocalDataSource _localDataSource;
  final AdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<ApiResponse<Admin>> getProfile({bool forceRefresh = false}) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<Admin>> updateProfile(Admin admin) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
