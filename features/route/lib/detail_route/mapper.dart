import 'data/models/response/detail_route_response.dart'
    as detail_route_response;
import 'domain/entities/detail_route_entity.dart' as detail_route_entity;

extension DetailRouteResponseMapper
    on detail_route_response.DetailRouteResponse {
  detail_route_entity.DetailRouteEntity toEntity() =>
      detail_route_entity.DetailRouteEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension DetailRouteEntityMapper on detail_route_entity.DetailRouteEntity {
  detail_route_response.DetailRouteResponse toResponse() =>
      detail_route_response.DetailRouteResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataDetailRouteResponseMapper
    on detail_route_response.DataDetailRoute {
  detail_route_entity.DataDetailRoute toEntity() =>
      detail_route_entity.DataDetailRoute(
        routeId: routeId,
        totalDistance: totalDistance,
        totalDuration: totalDuration,
        origin: origin?.toEntity(),
        destination: destination?.toEntity(),
        step: step?.map((e) => e.toEntity()).toList(),
      );
}

extension DataDetailRouteEntityMapper on detail_route_entity.DataDetailRoute {
  detail_route_response.DataDetailRoute toResponse() =>
      detail_route_response.DataDetailRoute(
        routeId: routeId,
        totalDistance: totalDistance,
        totalDuration: totalDuration,
        origin: origin?.toResponse(),
        destination: destination?.toResponse(),
        step: step?.map((e) => e.toResponse()).toList(),
      );
}

extension OriginDetailRouteResponseMapper
    on detail_route_response.OriginDetailRoute {
  detail_route_entity.OriginDetailRoute toEntity() =>
      detail_route_entity.OriginDetailRoute(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension OriginDetailRouteEntityMapper
    on detail_route_entity.OriginDetailRoute {
  detail_route_response.OriginDetailRoute toResponse() =>
      detail_route_response.OriginDetailRoute(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension DestinationDetailRouteResponseMapper
    on detail_route_response.DestinationDetailRoute {
  detail_route_entity.DestinationDetailRoute toEntity() =>
      detail_route_entity.DestinationDetailRoute(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension DestinationDetailRouteEntityMapper
    on detail_route_entity.DestinationDetailRoute {
  detail_route_response.DestinationDetailRoute toResponse() =>
      detail_route_response.DestinationDetailRoute(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension StepDetailRouteResponseMapper
    on detail_route_response.StepDetailRoute {
  detail_route_entity.StepDetailRoute toEntity() =>
      detail_route_entity.StepDetailRoute(
        stepId: stepId,
        routeId: routeId,
        stepNumber: stepNumber,
        distance: distance,
        duration: duration,
        destinationLocationId: destinationLocationId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        destination: destination?.toEntity(),
      );
}

extension StepDetailRouteEntityMapper on detail_route_entity.StepDetailRoute {
  detail_route_response.StepDetailRoute toResponse() =>
      detail_route_response.StepDetailRoute(
        stepId: stepId,
        routeId: routeId,
        stepNumber: stepNumber,
        distance: distance,
        duration: duration,
        destinationLocationId: destinationLocationId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        destination: destination?.toResponse(),
      );
}

extension AlphaDestinationDetailRouteResponseMapper
    on detail_route_response.AlphaDestinationDetailRoute {
  detail_route_entity.AlphaDestinationDetailRoute toEntity() =>
      detail_route_entity.AlphaDestinationDetailRoute(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension AlphaDestinationDetailRouteEntityMapper
    on detail_route_entity.AlphaDestinationDetailRoute {
  detail_route_response.AlphaDestinationDetailRoute toResponse() =>
      detail_route_response.AlphaDestinationDetailRoute(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}
