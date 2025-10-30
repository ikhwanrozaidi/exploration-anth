import '../../domain/entities/country_entity.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_entity.dart';
import 'road_level.dart';

class RoadSelectionResult {
  final RoadLevel completedAt;
  final Country? selectedCountry;
  final Province? selectedProvince;
  final District? selectedDistrict;
  final Road? selectedRoad;

  RoadSelectionResult({
    required this.completedAt,
    this.selectedCountry,
    this.selectedProvince,
    this.selectedDistrict,
    this.selectedRoad,
  });

  @override
  String toString() {
    final buffer = StringBuffer('RoadSelectionResult(');
    buffer.write('completedAt: ${completedAt.displayName}');
    if (selectedCountry != null) {
      buffer.write(', country: ${selectedCountry!.name}');
    }
    if (selectedProvince != null) {
      buffer.write(', province: ${selectedProvince!.name}');
    }
    if (selectedDistrict != null) {
      buffer.write(', district: ${selectedDistrict!.name}');
    }
    if (selectedRoad != null) {
      buffer.write(', road: ${selectedRoad!.name}');
    }
    buffer.write(')');
    return buffer.toString();
  }
}
