import 'package:core/core.dart';

import '../../data/models/body/delete_report_body.dart';
import '../entities/delete_report_entity.dart';
import '../repositories/detail_report_repository.dart';

class DeleteReportUseCase
    implements UseCase<DeleteReportEntity, DeleteReportBody> {
  DeleteReportUseCase({
    required this.repository,
  });

  final DetailReportRepository repository;

  @override
  Future<Either<MorphemeFailure, DeleteReportEntity>> call(
    DeleteReportBody body, {
    Map<String, String>? headers,
  }) {
    return repository.deleteReport(body, headers: headers);
  }
}
