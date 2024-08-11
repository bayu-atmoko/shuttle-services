import 'package:core/core.dart';

import '../../data/models/body/edit_report_body.dart';
import '../entities/edit_report_entity.dart';
import '../repositories/finish_report_repository.dart';

class EditReportUseCase implements UseCase<EditReportEntity, EditReportBody> {
  EditReportUseCase({
    required this.repository,
  });

  final FinishReportRepository repository;

  @override
  Future<Either<MorphemeFailure, EditReportEntity>> call(
    EditReportBody body, {
    Map<String, String>? headers,
  }) {
    return repository.editReport(body, headers: headers);
  }
}
