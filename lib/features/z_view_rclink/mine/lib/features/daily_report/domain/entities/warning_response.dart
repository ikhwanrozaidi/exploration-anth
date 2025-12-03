import 'package:equatable/equatable.dart';
import '../../../warnings/domain/entities/warning_item.dart';
import 'created_by_response.dart';

class WarningResponse extends Equatable {
  final int id;
  final String uid;
  final List<WarningItem> warningItems;
  final CreatedByResponse createdBy;
  final String? description;
  final String? longitude;
  final String? latitude;
  final String? fromSection;
  final String? toSection;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WarningResponse({
    required this.id,
    required this.uid,
    required this.warningItems,
    required this.createdBy,
    this.description,
    this.longitude,
    this.latitude,
    this.fromSection,
    this.toSection,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        warningItems,
        createdBy,
        description,
        longitude,
        latitude,
        fromSection,
        toSection,
        createdAt,
        updatedAt,
      ];
}
