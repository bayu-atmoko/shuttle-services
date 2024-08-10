import 'data/models/response/map_routes_response.dart' as map_routes_response;
import 'domain/entities/map_routes_entity.dart' as map_routes_entity;
import 'package:route/map/domain/entities/distance_matrix_entity.dart'
    as distance_entity;
import 'package:route/map/data/models/response/distance_matrix_response.dart'
    as distance_response;

extension MapRoutesResponseMapper on map_routes_response.MapRoutesResponse {
  map_routes_entity.MapRoutesEntity toEntity() =>
      map_routes_entity.MapRoutesEntity(
        routes: routes?.map((e) => e.toEntity()).toList(),
      );
}

extension MapRoutesEntityMapper on map_routes_entity.MapRoutesEntity {
  map_routes_response.MapRoutesResponse toResponse() =>
      map_routes_response.MapRoutesResponse(
        routes: routes?.map((e) => e.toResponse()).toList(),
      );
}

extension RoutesMapRoutesResponseMapper on map_routes_response.RoutesMapRoutes {
  map_routes_entity.RoutesMapRoutes toEntity() =>
      map_routes_entity.RoutesMapRoutes(
        routeLabels: routeLabels,
        legs: legs?.map((e) => e.toEntity()).toList(),
        distanceMeters: distanceMeters,
        duration: duration,
        staticDuration: staticDuration,
        polyline: polyline?.toEntity(),
        description: description,
        warnings: warnings,
        routeToken: routeToken,
      );
}

extension RoutesMapRoutesEntityMapper on map_routes_entity.RoutesMapRoutes {
  map_routes_response.RoutesMapRoutes toResponse() =>
      map_routes_response.RoutesMapRoutes(
        routeLabels: routeLabels,
        legs: legs?.map((e) => e.toResponse()).toList(),
        distanceMeters: distanceMeters,
        duration: duration,
        staticDuration: staticDuration,
        polyline: polyline?.toResponse(),
        description: description,
        warnings: warnings,
        routeToken: routeToken,
      );
}

extension PolylineMapRoutesResponseMapper
    on map_routes_response.PolylineMapRoutes {
  map_routes_entity.PolylineMapRoutes toEntity() =>
      map_routes_entity.PolylineMapRoutes(
        encodedPolyline: encodedPolyline,
      );
}

extension PolylineMapRoutesEntityMapper on map_routes_entity.PolylineMapRoutes {
  map_routes_response.PolylineMapRoutes toResponse() =>
      map_routes_response.PolylineMapRoutes(
        encodedPolyline: encodedPolyline,
      );
}

extension LegsMapRoutesResponseMapper on map_routes_response.LegsMapRoutes {
  map_routes_entity.LegsMapRoutes toEntity() => map_routes_entity.LegsMapRoutes(
        distanceMeters: distanceMeters,
        duration: duration,
        staticDuration: staticDuration,
        polyline: polyline?.toEntity(),
        startLocation: startLocation?.toEntity(),
        endLocation: endLocation?.toEntity(),
        steps: steps?.map((e) => e.toEntity()).toList(),
      );
}

extension LegsMapRoutesEntityMapper on map_routes_entity.LegsMapRoutes {
  map_routes_response.LegsMapRoutes toResponse() =>
      map_routes_response.LegsMapRoutes(
        distanceMeters: distanceMeters,
        duration: duration,
        staticDuration: staticDuration,
        polyline: polyline?.toResponse(),
        startLocation: startLocation?.toResponse(),
        endLocation: endLocation?.toResponse(),
        steps: steps?.map((e) => e.toResponse()).toList(),
      );
}

extension AlphaPolylineMapRoutesResponseMapper
    on map_routes_response.AlphaPolylineMapRoutes {
  map_routes_entity.AlphaPolylineMapRoutes toEntity() =>
      map_routes_entity.AlphaPolylineMapRoutes(
        encodedPolyline: encodedPolyline,
      );
}

extension AlphaPolylineMapRoutesEntityMapper
    on map_routes_entity.AlphaPolylineMapRoutes {
  map_routes_response.AlphaPolylineMapRoutes toResponse() =>
      map_routes_response.AlphaPolylineMapRoutes(
        encodedPolyline: encodedPolyline,
      );
}

extension StartLocationMapRoutesResponseMapper
    on map_routes_response.StartLocationMapRoutes {
  map_routes_entity.StartLocationMapRoutes toEntity() =>
      map_routes_entity.StartLocationMapRoutes(
        latLng: latLng?.toEntity(),
        heading: heading,
      );
}

extension StartLocationMapRoutesEntityMapper
    on map_routes_entity.StartLocationMapRoutes {
  map_routes_response.StartLocationMapRoutes toResponse() =>
      map_routes_response.StartLocationMapRoutes(
        latLng: latLng?.toResponse(),
        heading: heading,
      );
}

extension LatLngMapRoutesResponseMapper on map_routes_response.LatLngMapRoutes {
  map_routes_entity.LatLngMapRoutes toEntity() =>
      map_routes_entity.LatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension LatLngMapRoutesEntityMapper on map_routes_entity.LatLngMapRoutes {
  map_routes_response.LatLngMapRoutes toResponse() =>
      map_routes_response.LatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension EndLocationMapRoutesResponseMapper
    on map_routes_response.EndLocationMapRoutes {
  map_routes_entity.EndLocationMapRoutes toEntity() =>
      map_routes_entity.EndLocationMapRoutes(
        latLng: latLng?.toEntity(),
        heading: heading,
      );
}

extension EndLocationMapRoutesEntityMapper
    on map_routes_entity.EndLocationMapRoutes {
  map_routes_response.EndLocationMapRoutes toResponse() =>
      map_routes_response.EndLocationMapRoutes(
        latLng: latLng?.toResponse(),
        heading: heading,
      );
}

extension AlphaLatLngMapRoutesResponseMapper
    on map_routes_response.AlphaLatLngMapRoutes {
  map_routes_entity.AlphaLatLngMapRoutes toEntity() =>
      map_routes_entity.AlphaLatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension AlphaLatLngMapRoutesEntityMapper
    on map_routes_entity.AlphaLatLngMapRoutes {
  map_routes_response.AlphaLatLngMapRoutes toResponse() =>
      map_routes_response.AlphaLatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension StepsMapRoutesResponseMapper on map_routes_response.StepsMapRoutes {
  map_routes_entity.StepsMapRoutes toEntity() =>
      map_routes_entity.StepsMapRoutes(
        distanceMeters: distanceMeters,
        staticDuration: staticDuration,
        polyline: polyline?.toEntity(),
        startLocation: startLocation?.toEntity(),
        endLocation: endLocation?.toEntity(),
      );
}

extension StepsMapRoutesEntityMapper on map_routes_entity.StepsMapRoutes {
  map_routes_response.StepsMapRoutes toResponse() =>
      map_routes_response.StepsMapRoutes(
        distanceMeters: distanceMeters,
        staticDuration: staticDuration,
        polyline: polyline?.toResponse(),
        startLocation: startLocation?.toResponse(),
        endLocation: endLocation?.toResponse(),
      );
}

extension BetaPolylineMapRoutesResponseMapper
    on map_routes_response.BetaPolylineMapRoutes {
  map_routes_entity.BetaPolylineMapRoutes toEntity() =>
      map_routes_entity.BetaPolylineMapRoutes(
        encodedPolyline: encodedPolyline,
      );
}

extension BetaPolylineMapRoutesEntityMapper
    on map_routes_entity.BetaPolylineMapRoutes {
  map_routes_response.BetaPolylineMapRoutes toResponse() =>
      map_routes_response.BetaPolylineMapRoutes(
        encodedPolyline: encodedPolyline,
      );
}

extension AlphaStartLocationMapRoutesResponseMapper
    on map_routes_response.AlphaStartLocationMapRoutes {
  map_routes_entity.AlphaStartLocationMapRoutes toEntity() =>
      map_routes_entity.AlphaStartLocationMapRoutes(
        latLng: latLng?.toEntity(),
        heading: heading,
      );
}

extension AlphaStartLocationMapRoutesEntityMapper
    on map_routes_entity.AlphaStartLocationMapRoutes {
  map_routes_response.AlphaStartLocationMapRoutes toResponse() =>
      map_routes_response.AlphaStartLocationMapRoutes(
        latLng: latLng?.toResponse(),
        heading: heading,
      );
}

extension BetaLatLngMapRoutesResponseMapper
    on map_routes_response.BetaLatLngMapRoutes {
  map_routes_entity.BetaLatLngMapRoutes toEntity() =>
      map_routes_entity.BetaLatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension BetaLatLngMapRoutesEntityMapper
    on map_routes_entity.BetaLatLngMapRoutes {
  map_routes_response.BetaLatLngMapRoutes toResponse() =>
      map_routes_response.BetaLatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension AlphaEndLocationMapRoutesResponseMapper
    on map_routes_response.AlphaEndLocationMapRoutes {
  map_routes_entity.AlphaEndLocationMapRoutes toEntity() =>
      map_routes_entity.AlphaEndLocationMapRoutes(
        latLng: latLng?.toEntity(),
        heading: heading,
      );
}

extension AlphaEndLocationMapRoutesEntityMapper
    on map_routes_entity.AlphaEndLocationMapRoutes {
  map_routes_response.AlphaEndLocationMapRoutes toResponse() =>
      map_routes_response.AlphaEndLocationMapRoutes(
        latLng: latLng?.toResponse(),
        heading: heading,
      );
}

extension GammaLatLngMapRoutesResponseMapper
    on map_routes_response.GammaLatLngMapRoutes {
  map_routes_entity.GammaLatLngMapRoutes toEntity() =>
      map_routes_entity.GammaLatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension GammaLatLngMapRoutesEntityMapper
    on map_routes_entity.GammaLatLngMapRoutes {
  map_routes_response.GammaLatLngMapRoutes toResponse() =>
      map_routes_response.GammaLatLngMapRoutes(
        latitude: latitude,
        longitude: longitude,
      );
}

extension DistanceMatrixResponseMapper
    on distance_response.DistanceMatrixResponse {
  distance_entity.DistanceMatrixEntity toEntity() =>
      distance_entity.DistanceMatrixEntity(
        status: status,
        originAddresses: originAddresses,
        destinationAddresses: destinationAddresses,
        rows: rows?.map((row) => row.toEntity()).toList(),
      );
}

extension DistanceMatrixEntityMapper on distance_entity.DistanceMatrixEntity {
  distance_response.DistanceMatrixResponse toResponse() =>
      distance_response.DistanceMatrixResponse(
        status: status,
        originAddresses: originAddresses,
        destinationAddresses: destinationAddresses,
        rows: rows?.map((row) => row.toResponse()).toList(),
      );
}

extension RowResponseMapper on distance_response.Row {
  distance_entity.Row toEntity() => distance_entity.Row(
        elements: elements?.map((element) => element.toEntity()).toList(),
      );
}

extension RowEntityMapper on distance_entity.Row {
  distance_response.Row toResponse() => distance_response.Row(
        elements: elements?.map((element) => element.toResponse()).toList(),
      );
}

extension ElementResponseMapper on distance_response.Element {
  distance_entity.Element toEntity() => distance_entity.Element(
        distance: distance?.toEntity(),
        duration: duration?.toEntity(),
        status: status,
      );
}

extension ElementEntityMapper on distance_entity.Element {
  distance_response.Element toResponse() => distance_response.Element(
        distance: distance?.toResponse(),
        duration: duration?.toResponse(),
        status: status,
      );
}

extension DistanceResponseMapper on distance_response.Distance {
  distance_entity.Distance toEntity() => distance_entity.Distance(
        text: text,
        value: value,
      );
}

extension DistanceEntityMapper on distance_entity.Distance {
  distance_response.Distance toResponse() => distance_response.Distance(
        text: text,
        value: value,
      );
}

extension DurationResponseMapper on distance_response.Duration {
  distance_entity.Duration toEntity() => distance_entity.Duration(
        text: text,
        value: value,
      );
}

extension DurationEntityMapper on distance_entity.Duration {
  distance_response.Duration toResponse() => distance_response.Duration(
        text: text,
        value: value,
      );
}
