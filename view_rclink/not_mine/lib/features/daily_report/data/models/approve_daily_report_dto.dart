import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_daily_report_dto.freezed.dart';
part 'approve_daily_report_dto.g.dart';

@freezed
abstract class ApproveDailyReportDto with _$ApproveDailyReportDto {
  const factory ApproveDailyReportDto({required String reviewComment}) =
      _ApproveDailyReportDto;

  factory ApproveDailyReportDto.fromJson(Map<String, dynamic> json) =>
      _$ApproveDailyReportDtoFromJson(json);
}
