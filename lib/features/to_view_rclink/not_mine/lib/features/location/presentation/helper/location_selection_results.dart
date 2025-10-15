import '../../domain/entities/province_entity.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/road_entity.dart';

class LocationSelectionResult {
  // final CountryLocation? country;
  final Province? province;
  final District? district;
  final Road? road;

  LocationSelectionResult({
    // this.country,
    this.province,
    this.district,
    this.road,
  });

  /// Get the full display path (e.g., "Malaysia > Selangor > Gombak > FT0031")
  String get fullPath {
    final parts = <String>[];
    // if (country != null) parts.add(country!.name ?? '');
    if (province != null) parts.add(province!.name ?? '');
    if (district != null) parts.add(district!.name ?? '');
    if (road != null) {
      final roadName = road!.name ?? '';
      final roadNo = road!.roadNo;
      parts.add(roadNo != null ? '$roadName ($roadNo)' : roadName);
    }
    return parts.join(' > ');
  }

  /// Get the type of the last selected item
  String get type {
    if (road != null) return 'road';
    if (district != null) return 'district';
    if (province != null) return 'province';
    // if (country != null) return 'country';
    return 'none';
  }

  /// Get the last selected item's UID
  String? get selectedUid {
    if (road != null) return road!.uid;
    if (district != null) return district!.uid;
    if (province != null) return province!.uid;
    // if (country != null) return country!.uid;
    return null;
  }

  /// Get the last selected item's name
  String? get selectedName {
    if (road != null) {
      final roadName = road!.name ?? '';
      final roadNo = road!.roadNo;
      return roadNo != null ? '$roadName ($roadNo)' : roadName;
    }
    if (district != null) return district!.name;
    if (province != null) return province!.name;
    // if (country != null) return country!.name;
    return null;
  }

  @override
  String toString() {
    return 'LocationSelectionResult(type: $type, fullPath: $fullPath)';
  }

  /// Create a copy with updated values
  LocationSelectionResult copyWith({
    // CountryLocation? country,
    Province? province,
    District? district,
    Road? road,
  }) {
    return LocationSelectionResult(
      // country: country ?? this.country,
      province: province ?? this.province,
      district: district ?? this.district,
      road: road ?? this.road,
    );
  }

  // /// Convert to JSON (for backward compatibility if needed)
  // Map<String, dynamic> toJson() {
  //   return {
  //     // 'country': country?.toJson(),
  //     'province': province?.toJson(),
  //     'district': district?.toJson(),
  //     'road': road?.toJson(),
  //     'fullPath': fullPath,
  //     'type': type,
  //     'selectedUid': selectedUid,
  //     'selectedName': selectedName,
  //   };
  // }

  // /// Helper: Convert to Map<String, dynamic> for compatibility with old code
  // Map<String, dynamic> toMap() {
  //   return {
  //     'uid': selectedUid,
  //     'displayText': fullPath,
  //     'type': type,
  //     // 'country': country,
  //     'province': province,
  //     'district': district,
  //     'road': road,
  //   };
  // }
}
