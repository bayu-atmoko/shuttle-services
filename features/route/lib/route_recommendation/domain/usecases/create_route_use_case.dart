import 'package:core/core.dart';

import '../../data/models/body/create_route_body.dart';
import '../entities/create_route_entity.dart';
import '../repositories/route_recommendation_repository.dart';

class CreateRouteUseCase
    implements UseCase<CreateRouteEntity, CreateRouteBody> {
  CreateRouteUseCase({
    required this.repository,
  });

  final RouteRecommendationRepository repository;

  @override
  Future<Either<MorphemeFailure, CreateRouteEntity>> call(
    CreateRouteBody body, {
    Map<String, String>? headers,
  }) {
    return repository.createRoute(body, headers: headers);
  }
}
