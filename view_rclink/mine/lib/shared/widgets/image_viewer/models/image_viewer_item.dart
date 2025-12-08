/// Model for image viewer items
/// Supports both network URLs and local file paths
class ImageViewerItem {
  final String path;
  final bool isNetwork;
  final String? caption;

  const ImageViewerItem({
    required this.path,
    required this.isNetwork,
    this.caption,
  });

  /// Create from network URL
  factory ImageViewerItem.network(String url, {String? caption}) {
    return ImageViewerItem(
      path: url,
      isNetwork: true,
      caption: caption,
    );
  }

  /// Create from local file path
  factory ImageViewerItem.file(String filePath, {String? caption}) {
    return ImageViewerItem(
      path: filePath,
      isNetwork: false,
      caption: caption,
    );
  }

  /// Auto-detect if path is network or local
  /// Checks if path starts with http:// or https://
  factory ImageViewerItem.auto(String path, {String? caption}) {
    final isNetwork = path.startsWith('http://') || path.startsWith('https://');
    return ImageViewerItem(
      path: path,
      isNetwork: isNetwork,
      caption: caption,
    );
  }
}
