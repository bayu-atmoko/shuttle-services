import 'package:core/core.dart';

import '../../data/models/body/list_report_body.dart';
import '../entities/list_report_entity.dart';
import '../repositories/home_repository.dart';

class ListReportUseCase implements UseCase<ListReportEntity, ListReportBody> {
  ListReportUseCase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<Either<MorphemeFailure, ListReportEntity>> call(
    ListReportBody body, {
    Map<String, String>? headers,
  }) {
    return repository.listReport(body, headers: headers);
  }
}
