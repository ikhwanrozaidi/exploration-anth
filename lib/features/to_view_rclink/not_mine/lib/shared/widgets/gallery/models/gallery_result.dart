import 'gallery_image.dart';

class GalleryResult {
  final List<GalleryImage> images;
  final Map<String, List<GalleryImage>>? tabImages;

  GalleryResult({required this.images, this.tabImages});

  List<String> get imagePaths => images.map((e) => e.path).toList();

  Map<String, dynamic> toJson() => {
    'images': images.map((e) => e.toJson()).toList(),
    'tabImages': tabImages?.map(
      (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
    ),
  };
}
