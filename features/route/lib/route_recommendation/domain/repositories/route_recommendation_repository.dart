import 'package:core/core.dart';

import '../../data/models/body/route_optimization_body.dart';
import '../entities/route_optimization_entity.dart';
import '../../data/models/body/update_route_body.dart';
import '../entities/update_route_entity.dart';
import '../../data/models/body/create_route_body.dart';
import '../entities/create_route_entity.dart';

abstract class RouteRecommendationRepository {
  Future<Either<MorphemeFailure, CreateRouteEntity>> createRoute(
    CreateRouteBody body, {
    Map<String, String>? headers,
  });
  Future<Either<MorphemeFailure, UpdateRouteEntity>> updateRoute(
    UpdateRouteBody body, {
    Map<String, String>? headers,
  });
  Future<Either<MorphemeFailure, RouteOptimizationEntity>> routeOptimization(
    RouteOptimizationBody body, {
    Map<String, String>? headers,
  });
}
