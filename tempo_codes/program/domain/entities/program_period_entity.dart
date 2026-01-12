import 'package:equatable/equatable.dart';

class ProgramPeriod extends Equatable {
  final String periodStart;
  final String periodEnd;

  const ProgramPeriod({required this.periodStart, required this.periodEnd});

  Map<String, dynamic> toJson() => {
    'periodStart': periodStart,
    'periodEnd': periodEnd,
  };

  factory ProgramPeriod.fromJson(Map<String, dynamic> json) {
    return ProgramPeriod(
      periodStart: json['periodStart'] as String,
      periodEnd: json['periodEnd'] as String,
    );
  }

  @override
  List<Object?> get props => [periodStart, periodEnd];
}
