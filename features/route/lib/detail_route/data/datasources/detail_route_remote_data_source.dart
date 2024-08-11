import 'package:core/core.dart';

import '../models/body/detail_route_body.dart';
import '../models/response/detail_route_response.dart';

abstract class DetailRouteRemoteDataSource {
  Future<DetailRouteResponse> detailRoute(
    DetailRouteBody body, {
    Map<String, String>? headers,
  });
}

class DetailRouteRemoteDataSourceImpl implements DetailRouteRemoteDataSource {
  DetailRouteRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<DetailRouteResponse> detailRoute(
    DetailRouteBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.detailRoute(body.routeId),
      body: body.toMap(),
      headers: headers,
    );
    return DetailRouteResponse.fromJson(response.body);
  }
}
