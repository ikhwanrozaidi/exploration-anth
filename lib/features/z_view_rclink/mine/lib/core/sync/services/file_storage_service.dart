import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../sync_constants.dart';

/// Service for managing image file storage during sync
/// Handles copying temp files to permanent storage and cleanup after sync
@lazySingleton
class FileStorageService {
  /// Copy image from temp location to permanent app storage
  /// Returns the permanent file path
  Future<String> copyToAppStorage(
    String sourcePath,
    SyncEntityType entityType,
    String entityUID,
    ImageContextField contextField,
    int sequence,
  ) async {
    try {
      // CRITICAL FIX: Verify source file exists before attempting copy
      final sourceFile = File(sourcePath);
      if (!await sourceFile.exists()) {
        throw Exception('Source image file does not exist: $sourcePath');
      }

      // Get app documents directory (permanent storage)
      final appDir = await getApplicationDocumentsDirectory();

      // Create directory structure: sync_images/{entityType}/{entityUID}/
      final syncDir = Directory(
        path.join(
          appDir.path,
          'sync_images',
          entityType.value,
          entityUID,
        ),
      );

      // Create directory if it doesn't exist
      if (!await syncDir.exists()) {
        await syncDir.create(recursive: true);
      }

      // Generate filename: {contextField}_{sequence}_{timestamp}.{extension}
      final extension = path.extension(sourcePath);
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = '${contextField.value}_${sequence}_$timestamp$extension';

      final destinationPath = path.join(syncDir.path, filename);

      print('📂 File copy details:');
      print('   Source: $sourcePath');
      print('   Source exists: ${await sourceFile.exists()}');
      print('   Source size: ${await sourceFile.length()} bytes');
      print('   Extension: $extension');
      print('   Filename: $filename');
      print('   Destination: $destinationPath');

      // Copy file to permanent storage
      await sourceFile.copy(destinationPath);

      // CRITICAL FIX: Verify destination file was created successfully
      final destinationFile = File(destinationPath);
      if (!await destinationFile.exists()) {
        throw Exception('Failed to copy file to permanent storage: $destinationPath');
      }

      final destSize = await destinationFile.length();
      print('📁 Copied image to permanent storage: $destinationPath ($destSize bytes)');

      return destinationPath;
    } catch (e) {
      print('❌ Failed to copy image to permanent storage: $e');
      // CRITICAL FIX: Throw error instead of returning original path
      // This ensures the caller knows the operation failed
      rethrow;
    }
  }

  /// Delete a single file
  Future<void> deleteFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        print('🗑️ Deleted file: $filePath');
      }
    } catch (e) {
      print('⚠️ Failed to delete file $filePath: $e');
    }
  }

  /// Delete all images for a synced entity
  Future<void> deleteSyncedImages(
    SyncEntityType entityType,
    String entityUID,
  ) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final entityDir = Directory(
        path.join(
          appDir.path,
          'sync_images',
          entityType.value,
          entityUID,
        ),
      );

      if (await entityDir.exists()) {
        await entityDir.delete(recursive: true);
        print('🗑️ Deleted all images for ${entityType.value}/$entityUID');
      }
    } catch (e) {
      print('⚠️ Failed to delete images for ${entityType.value}/$entityUID: $e');
    }
  }

  /// Cleanup old synced images (optional maintenance)
  /// Deletes entity directories older than the specified age
  Future<void> cleanupOldSyncedImages({
    Duration age = const Duration(days: 7),
  }) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final syncImagesDir = Directory(
        path.join(appDir.path, 'sync_images'),
      );

      if (!await syncImagesDir.exists()) {
        return;
      }

      final cutoffDate = DateTime.now().subtract(age);
      int deletedCount = 0;

      // Iterate through entity type directories
      await for (final entityTypeDir in syncImagesDir.list()) {
        if (entityTypeDir is Directory) {
          // Iterate through entity UID directories
          await for (final entityDir in entityTypeDir.list()) {
            if (entityDir is Directory) {
              final stat = await entityDir.stat();
              if (stat.modified.isBefore(cutoffDate)) {
                await entityDir.delete(recursive: true);
                deletedCount++;
              }
            }
          }
        }
      }

      if (deletedCount > 0) {
        print('🧹 Cleaned up $deletedCount old synced image directories');
      }
    } catch (e) {
      print('⚠️ Failed to cleanup old synced images: $e');
    }
  }

  /// Get total storage size used by sync images
  Future<int> getSyncImageStorageSize() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final syncImagesDir = Directory(
        path.join(appDir.path, 'sync_images'),
      );

      if (!await syncImagesDir.exists()) {
        return 0;
      }

      int totalSize = 0;
      await for (final entity in syncImagesDir.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }

      return totalSize;
    } catch (e) {
      print('⚠️ Failed to calculate storage size: $e');
      return 0;
    }
  }
}
