import 'data/models/response/list_route_response.dart' as list_route_response;
import 'domain/entities/list_route_entity.dart' as list_route_entity;

extension ListRouteResponseMapper on list_route_response.ListRouteResponse {
  list_route_entity.ListRouteEntity toEntity() =>
      list_route_entity.ListRouteEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension ListRouteEntityMapper on list_route_entity.ListRouteEntity {
  list_route_response.ListRouteResponse toResponse() =>
      list_route_response.ListRouteResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataListRouteResponseMapper on list_route_response.DataListRoute {
  list_route_entity.DataListRoute toEntity() => list_route_entity.DataListRoute(
        data: data?.map((e) => e.toEntity()).toList(),
        total: total,
        perPage: perPage,
        currentPage: currentPage,
        lastPage: lastPage,
      );
}

extension DataListRouteEntityMapper on list_route_entity.DataListRoute {
  list_route_response.DataListRoute toResponse() =>
      list_route_response.DataListRoute(
        data: data?.map((e) => e.toResponse()).toList(),
        total: total,
        perPage: perPage,
        currentPage: currentPage,
        lastPage: lastPage,
      );
}

extension AlphaDataListRouteResponseMapper
    on list_route_response.AlphaDataListRoute {
  list_route_entity.AlphaDataListRoute toEntity() =>
      list_route_entity.AlphaDataListRoute(
        routeId: routeId,
        totalDistance: totalDistance,
        totalDuration: totalDuration,
        originLocationId: originLocationId,
        destinationLocationId: destinationLocationId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        origin: origin?.toEntity(),
        destination: destination?.toEntity(),
      );
}

extension AlphaDataListRouteEntityMapper
    on list_route_entity.AlphaDataListRoute {
  list_route_response.AlphaDataListRoute toResponse() =>
      list_route_response.AlphaDataListRoute(
        routeId: routeId,
        totalDistance: totalDistance,
        totalDuration: totalDuration,
        originLocationId: originLocationId,
        destinationLocationId: destinationLocationId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        origin: origin?.toResponse(),
        destination: destination?.toResponse(),
      );
}

extension OriginListRouteResponseMapper on list_route_response.OriginListRoute {
  list_route_entity.OriginListRoute toEntity() =>
      list_route_entity.OriginListRoute(
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

extension OriginListRouteEntityMapper on list_route_entity.OriginListRoute {
  list_route_response.OriginListRoute toResponse() =>
      list_route_response.OriginListRoute(
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

extension DestinationListRouteResponseMapper
    on list_route_response.DestinationListRoute {
  list_route_entity.DestinationListRoute toEntity() =>
      list_route_entity.DestinationListRoute(
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

extension DestinationListRouteEntityMapper
    on list_route_entity.DestinationListRoute {
  list_route_response.DestinationListRoute toResponse() =>
      list_route_response.DestinationListRoute(
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
