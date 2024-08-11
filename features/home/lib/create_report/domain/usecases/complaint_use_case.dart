import 'package:core/core.dart';

import '../../data/models/body/complaint_body.dart';
import '../entities/complaint_entity.dart';
import '../repositories/create_report_repository.dart';

class ComplaintUseCase implements UseCase<ComplaintEntity, ComplaintBody> {
  ComplaintUseCase({
    required this.repository,
  });

  final CreateReportRepository repository;

  @override
  Future<Either<MorphemeFailure, ComplaintEntity>> call(
    ComplaintBody body, {
    Map<String, String>? headers,
  }) {
    return repository.complaint(body, headers: headers);
  }
}
