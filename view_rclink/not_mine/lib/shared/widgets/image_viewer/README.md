# Image Viewer Widget

A full-screen image viewer with zoom/pinch support and thumbnail gallery navigation.

## Features

- Full-screen image viewing with swipe navigation
- Pinch-to-zoom support (powered by `photo_view`)
- Bottom thumbnail gallery with rounded boxes
- Tap thumbnails to jump to specific images
- Image counter display (e.g., "3 of 12")
- Support for both network URLs and local file paths
- Close button to exit viewer

## Usage

### Basic Usage (with auto-detection)

```dart
import 'package:rclink_app/shared/widgets/image_viewer/image_viewer_page.dart';

// Simple list of image paths (auto-detects network vs local)
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ImageViewerPage.fromPaths(
      paths: [
        'https://example.com/image1.jpg',
        '/path/to/local/image2.jpg',
        'https://example.com/image3.jpg',
      ],
      initialIndex: 0, // Start at first image
    ),
  ),
);
```

### Advanced Usage (with ImageViewerItem)

```dart
import 'package:rclink_app/shared/widgets/image_viewer/image_viewer_page.dart';
import 'package:rclink_app/shared/widgets/image_viewer/models/image_viewer_item.dart';

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ImageViewerPage(
      images: [
        ImageViewerItem.network('https://example.com/image1.jpg'),
        ImageViewerItem.file('/path/to/local/image.jpg'),
        ImageViewerItem.auto('https://example.com/image2.jpg'),
      ],
      initialIndex: 1, // Start at second image
      showCounter: true, // Show "2 of 3" counter
    ),
  ),
);
```

### Example: View Daily Report Images

```dart
// In your daily report detail page
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ImageViewerPage.fromPaths(
          paths: report.beforeImages, // List of URLs
          initialIndex: 0,
        ),
      ),
    );
  },
  child: Image.network(report.beforeImages.first),
)
```

### Example: View Local Camera Images

```dart
// After capturing images with camera
final List<String> localImagePaths = [
  '/storage/emulated/0/Pictures/image1.jpg',
  '/storage/emulated/0/Pictures/image2.jpg',
];

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ImageViewerPage.fromPaths(
      paths: localImagePaths,
    ),
  ),
);
```

## Parameters

### ImageViewerPage

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `images` | `List<ImageViewerItem>` | required | List of images to display |
| `initialIndex` | `int` | `0` | Index of image to show first |
| `showCounter` | `bool` | `true` | Show image counter (e.g., "3 of 12") |

### ImageViewerPage.fromPaths (Convenience Constructor)

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `paths` | `List<String>` | required | List of image paths (auto-detects network vs local) |
| `initialIndex` | `int` | `0` | Index of image to show first |
| `showCounter` | `bool` | `true` | Show image counter |

### ImageViewerItem Factory Methods

- `ImageViewerItem.network(String url)` - Create from network URL
- `ImageViewerItem.file(String path)` - Create from local file path
- `ImageViewerItem.auto(String path)` - Auto-detect based on path (checks for http:// or https://)

## Gestures

- **Swipe left/right**: Navigate between images
- **Pinch**: Zoom in/out on current image
- **Double tap**: Quick zoom
- **Tap thumbnail**: Jump to specific image
- **Tap close button**: Exit viewer

## Styling

The viewer uses a dark theme with:
- Black background
- Semi-transparent gradients for top/bottom bars
- White text and icons
- Highlighted border on selected thumbnail (3px white)
- Subtle border on unselected thumbnails (1px white at 30% opacity)
