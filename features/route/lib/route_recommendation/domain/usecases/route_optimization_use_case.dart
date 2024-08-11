import 'package:core/core.dart';

import '../../data/models/body/route_optimization_body.dart';
import '../entities/route_optimization_entity.dart';
import '../repositories/route_recommendation_repository.dart';

class RouteOptimizationUseCase
    implements UseCase<RouteOptimizationEntity, RouteOptimizationBody> {
  RouteOptimizationUseCase({
    required this.repository,
  });

  final RouteRecommendationRepository repository;

  @override
  Future<Either<MorphemeFailure, RouteOptimizationEntity>> call(
    RouteOptimizationBody body, {
    Map<String, String>? headers,
  }) {
    return repository.routeOptimization(body, headers: headers);
  }
}
