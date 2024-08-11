import 'package:core/core.dart';

import '../../data/models/body/detail_report_body.dart';
import '../entities/detail_report_entity.dart';
import '../repositories/detail_report_repository.dart';

class DetailReportUseCase
    implements UseCase<DetailReportEntity, DetailReportBody> {
  DetailReportUseCase({
    required this.repository,
  });

  final DetailReportRepository repository;

  @override
  Future<Either<MorphemeFailure, DetailReportEntity>> call(
    DetailReportBody body, {
    Map<String, String>? headers,
  }) {
    return repository.detailReport(body, headers: headers);
  }
}
