import 'package:equatable/equatable.dart';
import 'warning_type.dart';

class WarningCategory extends Equatable {
  final int id;
  final String uid;
  final String name;
  final WarningType warningType;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WarningCategory({
    required this.id,
    required this.uid,
    required this.name,
    required this.warningType,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        name,
        warningType,
        createdAt,
        updatedAt,
      ];
}
