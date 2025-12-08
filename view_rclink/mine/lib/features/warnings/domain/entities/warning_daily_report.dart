import 'package:equatable/equatable.dart';
import '../../../daily_report/domain/entities/report_quantity.dart';

class WarningDailyReport extends Equatable {
  final int id;
  final String uid;
  final String name;
  final DateTime createdAt;
  final String status;
  final bool workPerformed;
  final List<String> equipmentNames;
  final List<ReportQuantity> reportQuantities;

  const WarningDailyReport({
    required this.id,
    required this.uid,
    required this.name,
    required this.createdAt,
    required this.status,
    required this.workPerformed,
    this.equipmentNames = const [],
    this.reportQuantities = const [],
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    createdAt,
    status,
    workPerformed,
    equipmentNames,
    reportQuantities,
  ];
}
