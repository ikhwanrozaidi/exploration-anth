import 'package:equatable/equatable.dart';

class DailyReportEquipmentResponse extends Equatable {
  final String name;
  final String uid;

  const DailyReportEquipmentResponse({required this.name, required this.uid});

  @override
  List<Object?> get props => [name, uid];
}
