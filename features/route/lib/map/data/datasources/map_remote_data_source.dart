import 'package:core/core.dart';
import 'package:route/map/data/models/body/distance_matrix_body.dart';
import 'package:route/map/data/models/response/distance_matrix_response.dart';

import '../models/body/map_routes_body.dart';
import '../models/response/map_routes_response.dart';

abstract class MapRemoteDataSource {
  Future<MapRoutesResponse> mapRoutes(MapRoutesBody body);
  Future<DistanceMatrixResponse> distanceMatrix(DistanceMatrixBody body);
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  MapRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<MapRoutesResponse> mapRoutes(MapRoutesBody body) async {
    final response = await http.post(
      MorphemeEndpoints.mapRoutes,
      body: body.toMap(),
      headers: {
        "Content-Type": "application/json",
        "X-Goog-Api-Key": Environment.mapsApiKey,
        "X-Goog-FieldMask":
            "routes.duration,routes.distanceMeters,routes.legs.steps"
      }.map((key, value) => MapEntry(key, value.toString())),
    );
    return MapRoutesResponse.fromJson(response.body);
  }

  @override
  Future<DistanceMatrixResponse> distanceMatrix(DistanceMatrixBody body) async {
    final response = await http.post(
      MorphemeEndpoints.distanceMatrix(
        body.getOriginsJoin(),
        body.getDestinationsJoin(),
        Environment.mapsApiKey,
      ),
      headers: {
        "Content-Type": "application/json",
      }.map((key, value) => MapEntry(key, value.toString())),
    );
    return DistanceMatrixResponse.fromJson(response.body);
  }
}
