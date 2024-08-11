import 'package:core/core.dart';

import '../../data/models/body/list_report_body.dart';
import '../entities/list_report_entity.dart';

abstract class HomeRepository {
  Future<Either<MorphemeFailure, ListReportEntity>> listReport(
    ListReportBody body, {
    Map<String, String>? headers,
  });
}
