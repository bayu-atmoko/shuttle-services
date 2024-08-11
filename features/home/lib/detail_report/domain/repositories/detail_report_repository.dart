import 'package:core/core.dart';

import '../../data/models/body/delete_report_body.dart';
import '../entities/delete_report_entity.dart';
import '../../data/models/body/detail_report_body.dart';
import '../entities/detail_report_entity.dart';

abstract class DetailReportRepository {
  Future<Either<MorphemeFailure, DetailReportEntity>> detailReport(
    DetailReportBody body, {
    Map<String, String>? headers,
  });
  Future<Either<MorphemeFailure, DeleteReportEntity>> deleteReport(
    DeleteReportBody body, {
    Map<String, String>? headers,
  });
}
