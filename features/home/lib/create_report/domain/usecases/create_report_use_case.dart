import 'package:core/core.dart';

import '../../data/models/body/create_report_body.dart';
import '../entities/create_report_entity.dart';
import '../repositories/create_report_repository.dart';

class CreateReportUseCase
    implements UseCase<CreateReportEntity, CreateReportBody> {
  CreateReportUseCase({
    required this.repository,
  });

  final CreateReportRepository repository;

  @override
  Future<Either<MorphemeFailure, CreateReportEntity>> call(
    CreateReportBody body, {
    Map<String, String>? headers,
  }) {
    return repository.createReport(body, headers: headers);
  }
}
