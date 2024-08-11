import 'package:core/core.dart';

import '../../data/models/body/update_route_body.dart';
import '../entities/update_route_entity.dart';
import '../repositories/route_recommendation_repository.dart';

class UpdateRouteUseCase
    implements UseCase<UpdateRouteEntity, UpdateRouteBody> {
  UpdateRouteUseCase({
    required this.repository,
  });

  final RouteRecommendationRepository repository;

  @override
  Future<Either<MorphemeFailure, UpdateRouteEntity>> call(
    UpdateRouteBody body, {
    Map<String, String>? headers,
  }) {
    return repository.updateRoute(body, headers: headers);
  }
}
