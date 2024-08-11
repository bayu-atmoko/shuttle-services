import 'package:core/core.dart';

import '../../data/models/body/edit_report_body.dart';
import '../entities/edit_report_entity.dart';

abstract class FinishReportRepository {
  Future<Either<MorphemeFailure, EditReportEntity>> editReport(
    EditReportBody body, {
    Map<String, String>? headers,
  });
}
