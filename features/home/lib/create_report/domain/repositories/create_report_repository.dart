import 'package:core/core.dart';

import '../../data/models/body/create_report_body.dart';
import '../entities/create_report_entity.dart';
import '../../data/models/body/complaint_body.dart';
import '../entities/complaint_entity.dart';

abstract class CreateReportRepository {
  Future<Either<MorphemeFailure, ComplaintEntity>> complaint(
    ComplaintBody body, {
    Map<String, String>? headers,
  });
  Future<Either<MorphemeFailure, CreateReportEntity>> createReport(
    CreateReportBody body, {
    Map<String, String>? headers,
  });
}
