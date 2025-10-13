class LocationSelectionResult {
  final Map<String, dynamic>? country;
  final Map<String, dynamic>? province;
  final Map<String, dynamic>? district;
  final Map<String, dynamic>? road;

  LocationSelectionResult({
    this.country,
    this.province,
    this.district,
    this.road,
  });

  /// Get the full display path (e.g., "Malaysia > Selangor > Gombak > FT0031")
  String get fullPath {
    final parts = <String>[];
    if (country != null) parts.add(country!['name'] as String);
    if (province != null) parts.add(province!['name'] as String);
    if (district != null) parts.add(district!['name'] as String);
    if (road != null) {
      final roadName = road!['name'] as String;
      final roadNo = road!['roadNo'] as String?;
      parts.add(roadNo != null ? '$roadName ($roadNo)' : roadName);
    }
    return parts.join(' > ');
  }

  /// Get the type of the last selected item
  String get type {
    if (road != null) return 'road';
    if (district != null) return 'district';
    if (province != null) return 'province';
    if (country != null) return 'country';
    return 'none';
  }

  /// Get the last selected item's UID
  String? get selectedUid {
    if (road != null) return road!['uid'] as String?;
    if (district != null) return district!['uid'] as String?;
    if (province != null) return province!['uid'] as String?;
    if (country != null) return country!['uid'] as String?;
    return null;
  }

  /// Get the last selected item's name
  String? get selectedName {
    if (road != null) {
      final roadName = road!['name'] as String;
      final roadNo = road!['roadNo'] as String?;
      return roadNo != null ? '$roadName ($roadNo)' : roadName;
    }
    if (district != null) return district!['name'] as String?;
    if (province != null) return province!['name'] as String?;
    if (country != null) return country!['name'] as String?;
    return null;
  }

  @override
  String toString() {
    return 'LocationSelectionResult(type: $type, fullPath: $fullPath)';
  }

  /// Create a copy with updated values
  LocationSelectionResult copyWith({
    Map<String, dynamic>? country,
    Map<String, dynamic>? province,
    Map<String, dynamic>? district,
    Map<String, dynamic>? road,
  }) {
    return LocationSelectionResult(
      country: country ?? this.country,
      province: province ?? this.province,
      district: district ?? this.district,
      road: road ?? this.road,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'province': province,
      'district': district,
      'road': road,
      'fullPath': fullPath,
      'type': type,
      'selectedUid': selectedUid,
      'selectedName': selectedName,
    };
  }
}
