import 'package:core/core.dart';

class DetailRouteEntity extends Equatable {
  const DetailRouteEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataDetailRoute? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataDetailRoute extends Equatable {
  const DataDetailRoute({
    required this.routeId,
    required this.totalDistance,
    required this.totalDuration,
    required this.origin,
    required this.destination,
    required this.step,
  });

  final int? routeId;
  final int? totalDistance;
  final int? totalDuration;
  final OriginDetailRoute? origin;
  final DestinationDetailRoute? destination;
  final List<StepDetailRoute>? step;

  @override
  List<Object?> get props => [
        routeId,
        totalDistance,
        totalDuration,
        origin,
        destination,
        step,
      ];
}

class OriginDetailRoute extends Equatable {
  const OriginDetailRoute({
    required this.locationId,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.district,
    required this.village,
  });

  final int? locationId;
  final String? name;
  final String? address;
  final int? latitude;
  final int? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? district;
  final String? village;

  @override
  List<Object?> get props => [
        locationId,
        name,
        address,
        latitude,
        longitude,
        createdAt,
        updatedAt,
        deletedAt,
        district,
        village,
      ];
}

class DestinationDetailRoute extends Equatable {
  const DestinationDetailRoute({
    required this.locationId,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.district,
    required this.village,
  });

  final int? locationId;
  final String? name;
  final String? address;
  final int? latitude;
  final int? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? district;
  final String? village;

  @override
  List<Object?> get props => [
        locationId,
        name,
        address,
        latitude,
        longitude,
        createdAt,
        updatedAt,
        deletedAt,
        district,
        village,
      ];
}

class StepDetailRoute extends Equatable {
  const StepDetailRoute({
    required this.stepId,
    required this.routeId,
    required this.stepNumber,
    required this.distance,
    required this.duration,
    required this.destinationLocationId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.destination,
  });

  final int? stepId;
  final int? routeId;
  final int? stepNumber;
  final int? distance;
  final int? duration;
  final int? destinationLocationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final AlphaDestinationDetailRoute? destination;

  @override
  List<Object?> get props => [
        stepId,
        routeId,
        stepNumber,
        distance,
        duration,
        destinationLocationId,
        createdAt,
        updatedAt,
        deletedAt,
        destination,
      ];
}

class AlphaDestinationDetailRoute extends Equatable {
  const AlphaDestinationDetailRoute({
    required this.locationId,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.district,
    required this.village,
  });

  final int? locationId;
  final String? name;
  final String? address;
  final int? latitude;
  final int? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? district;
  final String? village;

  @override
  List<Object?> get props => [
        locationId,
        name,
        address,
        latitude,
        longitude,
        createdAt,
        updatedAt,
        deletedAt,
        district,
        village,
      ];
}
