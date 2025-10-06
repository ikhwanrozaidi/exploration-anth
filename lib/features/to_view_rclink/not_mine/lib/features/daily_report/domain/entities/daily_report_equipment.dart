import 'package:equatable/equatable.dart';

class DailyReportEquipment extends Equatable {
  final String name;
  final String uid;

  const DailyReportEquipment({required this.name, required this.uid});

  @override
  List<Object?> get props => [name, uid];
}
