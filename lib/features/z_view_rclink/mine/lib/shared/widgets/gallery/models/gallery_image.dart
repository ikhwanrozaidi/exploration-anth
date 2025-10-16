class GalleryImage {
  final String path;
  final double? latitude;
  final double? longitude;
  final DateTime capturedAt;
  final String? type; // 'before', 'current', 'after', or null for general

  GalleryImage({
    required this.path,
    this.latitude,
    this.longitude,
    required this.capturedAt,
    this.type,
  });

  Map<String, dynamic> toJson() => {
    'path': path,
    'latitude': latitude,
    'longitude': longitude,
    'capturedAt': capturedAt.toIso8601String(),
    'type': type,
  };

  factory GalleryImage.fromJson(Map<String, dynamic> json) => GalleryImage(
    path: json['path'] as String,
    latitude: json['latitude'] as double?,
    longitude: json['longitude'] as double?,
    capturedAt: DateTime.parse(json['capturedAt'] as String),
    type: json['type'] as String?,
  );

  GalleryImage copyWith({
    String? path,
    double? latitude,
    double? longitude,
    DateTime? capturedAt,
    String? type,
  }) {
    return GalleryImage(
      path: path ?? this.path,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      capturedAt: capturedAt ?? this.capturedAt,
      type: type ?? this.type,
    );
  }
}
