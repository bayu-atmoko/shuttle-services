import 'data/models/response/create_route_response.dart'
    as create_route_response;
import 'domain/entities/create_route_entity.dart' as create_route_entity;
import 'data/models/response/update_route_response.dart'
    as update_route_response;
import 'domain/entities/update_route_entity.dart' as update_route_entity;
import 'data/models/response/route_optimization_response.dart'
    as route_optimization_response;
import 'domain/entities/route_optimization_entity.dart'
    as route_optimization_entity;

extension CreateRouteResponseMapper
    on create_route_response.CreateRouteResponse {
  create_route_entity.CreateRouteEntity toEntity() =>
      create_route_entity.CreateRouteEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension CreateRouteEntityMapper on create_route_entity.CreateRouteEntity {
  create_route_response.CreateRouteResponse toResponse() =>
      create_route_response.CreateRouteResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataCreateRouteResponseMapper
    on create_route_response.DataCreateRoute {
  create_route_entity.DataCreateRoute toEntity() =>
      create_route_entity.DataCreateRoute(
        routeId: routeId,
      );
}

extension DataCreateRouteEntityMapper on create_route_entity.DataCreateRoute {
  create_route_response.DataCreateRoute toResponse() =>
      create_route_response.DataCreateRoute(
        routeId: routeId,
      );
}

extension UpdateRouteResponseMapper
    on update_route_response.UpdateRouteResponse {
  update_route_entity.UpdateRouteEntity toEntity() =>
      update_route_entity.UpdateRouteEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension UpdateRouteEntityMapper on update_route_entity.UpdateRouteEntity {
  update_route_response.UpdateRouteResponse toResponse() =>
      update_route_response.UpdateRouteResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataUpdateRouteResponseMapper
    on update_route_response.DataUpdateRoute {
  update_route_entity.DataUpdateRoute toEntity() =>
      update_route_entity.DataUpdateRoute(
        routeId: routeId,
        totalDistance: totalDistance,
        totalDuration: totalDuration,
        origin: origin?.toEntity(),
        destination: destination?.toEntity(),
        step: step?.map((e) => e.toEntity()).toList(),
      );
}

extension DataUpdateRouteEntityMapper on update_route_entity.DataUpdateRoute {
  update_route_response.DataUpdateRoute toResponse() =>
      update_route_response.DataUpdateRoute(
        routeId: routeId,
        totalDistance: totalDistance,
        totalDuration: totalDuration,
        origin: origin?.toResponse(),
        destination: destination?.toResponse(),
        step: step?.map((e) => e.toResponse()).toList(),
      );
}

extension OriginUpdateRouteResponseMapper
    on update_route_response.OriginUpdateRoute {
  update_route_entity.OriginUpdateRoute toEntity() =>
      update_route_entity.OriginUpdateRoute(
        name: name,
        address: address,
        village: village,
        district: district,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension OriginUpdateRouteEntityMapper
    on update_route_entity.OriginUpdateRoute {
  update_route_response.OriginUpdateRoute toResponse() =>
      update_route_response.OriginUpdateRoute(
        name: name,
        address: address,
        village: village,
        district: district,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension DestinationUpdateRouteResponseMapper
    on update_route_response.DestinationUpdateRoute {
  update_route_entity.DestinationUpdateRoute toEntity() =>
      update_route_entity.DestinationUpdateRoute(
        name: name,
        address: address,
        village: village,
        district: district,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension DestinationUpdateRouteEntityMapper
    on update_route_entity.DestinationUpdateRoute {
  update_route_response.DestinationUpdateRoute toResponse() =>
      update_route_response.DestinationUpdateRoute(
        name: name,
        address: address,
        village: village,
        district: district,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension StepUpdateRouteResponseMapper
    on update_route_response.StepUpdateRoute {
  update_route_entity.StepUpdateRoute toEntity() =>
      update_route_entity.StepUpdateRoute(
        routeId: routeId,
        stepNumber: stepNumber,
        distance: distance,
        duration: duration,
        destinationLocationId: destinationLocationId,
        updatedAt: updatedAt,
        createdAt: createdAt,
        stepId: stepId,
        destination: destination?.toEntity(),
      );
}

extension StepUpdateRouteEntityMapper on update_route_entity.StepUpdateRoute {
  update_route_response.StepUpdateRoute toResponse() =>
      update_route_response.StepUpdateRoute(
        routeId: routeId,
        stepNumber: stepNumber,
        distance: distance,
        duration: duration,
        destinationLocationId: destinationLocationId,
        updatedAt: updatedAt,
        createdAt: createdAt,
        stepId: stepId,
        destination: destination?.toResponse(),
      );
}

extension AlphaDestinationUpdateRouteResponseMapper
    on update_route_response.AlphaDestinationUpdateRoute {
  update_route_entity.AlphaDestinationUpdateRoute toEntity() =>
      update_route_entity.AlphaDestinationUpdateRoute(
        name: name,
        address: address,
        village: village,
        district: district,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension AlphaDestinationUpdateRouteEntityMapper
    on update_route_entity.AlphaDestinationUpdateRoute {
  update_route_response.AlphaDestinationUpdateRoute toResponse() =>
      update_route_response.AlphaDestinationUpdateRoute(
        name: name,
        address: address,
        village: village,
        district: district,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension RouteOptimizationResponseMapper
    on route_optimization_response.RouteOptimizationResponse {
  route_optimization_entity.RouteOptimizationEntity toEntity() =>
      route_optimization_entity.RouteOptimizationEntity(
        success: success,
        message: message,
        data: data?.map((e) => e.toEntity()).toList(),
      );
}

extension RouteOptimizationEntityMapper
    on route_optimization_entity.RouteOptimizationEntity {
  route_optimization_response.RouteOptimizationResponse toResponse() =>
      route_optimization_response.RouteOptimizationResponse(
        success: success,
        message: message,
        data: data?.map((e) => e.toResponse()).toList(),
      );
}

extension DataRouteOptimizationResponseMapper
    on route_optimization_response.DataRouteOptimization {
  route_optimization_entity.DataRouteOptimization toEntity() =>
      route_optimization_entity.DataRouteOptimization(
        originReportId: originReportId,
        destinationReportId: destinationReportId,
        duration: duration,
        distance: distance,
      );
}

extension DataRouteOptimizationEntityMapper
    on route_optimization_entity.DataRouteOptimization {
  route_optimization_response.DataRouteOptimization toResponse() =>
      route_optimization_response.DataRouteOptimization(
        originReportId: originReportId,
        destinationReportId: destinationReportId,
        duration: duration,
        distance: distance,
      );
}
