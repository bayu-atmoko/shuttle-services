import 'package:core/core.dart';

import '../../data/models/body/list_route_body.dart';
import '../entities/list_route_entity.dart';
import '../repositories/list_route_repository.dart';

class ListRouteUseCase implements UseCase<ListRouteEntity, ListRouteBody> {
  ListRouteUseCase({
    required this.repository,
  });

  final ListRouteRepository repository;

  @override
  Future<Either<MorphemeFailure, ListRouteEntity>> call(
    ListRouteBody body, {
    Map<String, String>? headers,
  }) {
    return repository.listRoute(body, headers: headers);
  }
}
