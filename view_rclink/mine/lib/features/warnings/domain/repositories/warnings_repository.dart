import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/create_report_warning_model.dart';
import '../entities/warning.dart';

abstract class WarningsRepository {
  /// Create a warning from a daily report
  Future<Either<Failure, Warning>> createReportWarning(
    CreateReportWarningModel data,
  );
}
