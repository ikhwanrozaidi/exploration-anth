import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_entity.dart';

class RoadSelectionResult {
  final Province? selectedProvince;
  final District? selectedDistrict;
  final Road? selectedRoad;

  RoadSelectionResult({
    this.selectedProvince,
    this.selectedDistrict,
    this.selectedRoad,
  });

  @override
  String toString() {
    final parts = <String>[];
    if (selectedProvince != null) parts.add(selectedProvince!.name ?? '');
    if (selectedDistrict != null) parts.add(selectedDistrict!.name ?? '');
    if (selectedRoad != null) {
      final roadDisplay = selectedRoad!.roadNo != null
          ? '${selectedRoad!.name} (${selectedRoad!.roadNo})'
          : selectedRoad!.name ?? '';
      parts.add(roadDisplay);
    }
    return parts.join(' > ');
  }

  bool get isComplete =>
      selectedProvince != null &&
      selectedDistrict != null &&
      selectedRoad != null;
}
