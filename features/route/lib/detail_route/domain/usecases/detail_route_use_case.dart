import 'package:core/core.dart';

import '../../data/models/body/detail_route_body.dart';
import '../entities/detail_route_entity.dart';
import '../repositories/detail_route_repository.dart';

class DetailRouteUseCase
    implements UseCase<DetailRouteEntity, DetailRouteBody> {
  DetailRouteUseCase({
    required this.repository,
  });

  final DetailRouteRepository repository;

  @override
  Future<Either<MorphemeFailure, DetailRouteEntity>> call(
    DetailRouteBody body, {
    Map<String, String>? headers,
  }) {
    return repository.detailRoute(body, headers: headers);
  }
}
