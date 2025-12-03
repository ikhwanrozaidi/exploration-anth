import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../models/gallery_image.dart';
import 'permission_service.dart';

class CameraService {
  final ImagePicker _picker = ImagePicker();

  Future<GalleryImage?> captureImage({
    bool pinPointFirst = false,
    String? imageType,
  }) async {
    try {
      // Request camera permission
      final hasPermission = await PermissionService.requestCameraPermission();
      if (!hasPermission) {
        throw Exception(
          'Camera permission is required to take photos. Please enable it in settings.',
        );
      }

      // Get location if needed
      double? latitude;
      double? longitude;
      if (pinPointFirst) {
        final position = await PermissionService.getCurrentLocation();
        latitude = position?.latitude;
        longitude = position?.longitude;
      }

      // Capture image
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (image == null) return null;

      // Save to app directory
      final savedPath = await _saveImageToAppDirectory(image);

      return GalleryImage(
        path: savedPath,
        latitude: latitude,
        longitude: longitude,
        capturedAt: DateTime.now(),
        type: imageType,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GalleryImage?> pickFromGallery({
    bool pinPointFirst = false,
    String? imageType,
  }) async {
    try {
      // Request storage/photos permission
      final hasPermission = await PermissionService.requestStoragePermission();
      if (!hasPermission) {
        throw Exception(
          'Gallery permission is required to select photos. Please enable it in settings.',
        );
      }

      // Get location if needed
      double? latitude;
      double? longitude;
      if (pinPointFirst) {
        final position = await PermissionService.getCurrentLocation();
        latitude = position?.latitude;
        longitude = position?.longitude;
      }

      // Pick image
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image == null) return null;

      // Save to app directory
      final savedPath = await _saveImageToAppDirectory(image);

      return GalleryImage(
        path: savedPath,
        latitude: latitude,
        longitude: longitude,
        capturedAt: DateTime.now(),
        type: imageType,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _saveImageToAppDirectory(XFile image) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';
      final savedPath = path.join(appDir.path, 'images', fileName);

      // Create directory if not exists
      final directory = Directory(path.dirname(savedPath));
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Debug logging
      print('📸 Saving camera image:');
      print('   Source: ${image.path}');
      print('   Source exists: ${await File(image.path).exists()}');
      print('   Destination: $savedPath');
      print('   Platform: ${Platform.operatingSystem} ${Platform.version}');

      // CRITICAL FIX: Use XFile.saveTo() instead of File.copy()
      // This method handles permissions correctly on all Android versions
      await image.saveTo(savedPath);

      // Verify file was saved successfully
      final savedFile = File(savedPath);
      final fileExists = await savedFile.exists();

      if (!fileExists) {
        throw Exception('Failed to save camera image to: $savedPath');
      }

      final fileSize = await savedFile.length();
      print('   ✅ Image saved successfully (${fileSize} bytes)');

      return savedPath;
    } catch (e) {
      print('   ❌ Failed to save image: $e');
      rethrow;
    }
  }

  Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Silent fail
    }
  }
}
