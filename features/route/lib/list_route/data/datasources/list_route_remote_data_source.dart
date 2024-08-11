import 'package:core/core.dart';

import '../models/body/list_route_body.dart';
import '../models/response/list_route_response.dart';

abstract class ListRouteRemoteDataSource {
  Future<ListRouteResponse> listRoute(
    ListRouteBody body, {
    Map<String, String>? headers,
  });
}

class ListRouteRemoteDataSourceImpl implements ListRouteRemoteDataSource {
  ListRouteRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ListRouteResponse> listRoute(
    ListRouteBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.listRoute(
        body.page.toString(),
        body.perPage.toString(),
        body.sort,
        body.sortType,
      ),
      body: body.toMap(),
      headers: headers,
    );
    return ListRouteResponse.fromJson(response.body);
  }
}
