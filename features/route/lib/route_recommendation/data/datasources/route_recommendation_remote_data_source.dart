import 'package:core/core.dart';

import '../models/body/route_optimization_body.dart';
import '../models/response/route_optimization_response.dart';
import '../models/body/update_route_body.dart';
import '../models/response/update_route_response.dart';
import '../models/body/create_route_body.dart';
import '../models/response/create_route_response.dart';

abstract class RouteRecommendationRemoteDataSource {
  Future<RouteOptimizationResponse> routeOptimization(
    RouteOptimizationBody body, {
    Map<String, String>? headers,
  });
  Future<UpdateRouteResponse> updateRoute(
    UpdateRouteBody body, {
    Map<String, String>? headers,
  });
  Future<CreateRouteResponse> createRoute(
    CreateRouteBody body, {
    Map<String, String>? headers,
  });
}

class RouteRecommendationRemoteDataSourceImpl
    implements RouteRecommendationRemoteDataSource {
  RouteRecommendationRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<CreateRouteResponse> createRoute(
    CreateRouteBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.createRoute,
      body: body.toMap(),
      headers: headers,
    );
    return CreateRouteResponse.fromJson(response.body);
  }

  @override
  Future<UpdateRouteResponse> updateRoute(
    UpdateRouteBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      MorphemeEndpoints.updateRoute(body.routeId),
      body: body.toMap(),
      headers: headers,
    );
    return UpdateRouteResponse.fromJson(response.body);
  }

  @override
  Future<RouteOptimizationResponse> routeOptimization(
    RouteOptimizationBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.routeOptimization,
      body: body.toMap(),
      headers: headers,
    );
    return RouteOptimizationResponse.fromJson(response.body);
  }
}
