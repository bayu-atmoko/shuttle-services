import 'package:core/core.dart';

class UpdateRouteEntity extends Equatable {
  const UpdateRouteEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataUpdateRoute? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataUpdateRoute extends Equatable {
  const DataUpdateRoute({
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
  final OriginUpdateRoute? origin;
  final DestinationUpdateRoute? destination;
  final List<StepUpdateRoute>? step;

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

class OriginUpdateRoute extends Equatable {
  const OriginUpdateRoute({
    required this.name,
    required this.address,
    required this.village,
    required this.district,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    required this.createdAt,
    required this.locationId,
  });

  final String? name;
  final String? address;
  final String? village;
  final String? district;
  final int? latitude;
  final int? longitude;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? locationId;

  @override
  List<Object?> get props => [
        name,
        address,
        village,
        district,
        latitude,
        longitude,
        updatedAt,
        createdAt,
        locationId,
      ];
}

class DestinationUpdateRoute extends Equatable {
  const DestinationUpdateRoute({
    required this.name,
    required this.address,
    required this.village,
    required this.district,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    required this.createdAt,
    required this.locationId,
  });

  final String? name;
  final String? address;
  final String? village;
  final String? district;
  final int? latitude;
  final int? longitude;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? locationId;

  @override
  List<Object?> get props => [
        name,
        address,
        village,
        district,
        latitude,
        longitude,
        updatedAt,
        createdAt,
        locationId,
      ];
}

class StepUpdateRoute extends Equatable {
  const StepUpdateRoute({
    required this.routeId,
    required this.stepNumber,
    required this.distance,
    required this.duration,
    required this.destinationLocationId,
    required this.updatedAt,
    required this.createdAt,
    required this.stepId,
    required this.destination,
  });

  final int? routeId;
  final int? stepNumber;
  final int? distance;
  final int? duration;
  final int? destinationLocationId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? stepId;
  final AlphaDestinationUpdateRoute? destination;

  @override
  List<Object?> get props => [
        routeId,
        stepNumber,
        distance,
        duration,
        destinationLocationId,
        updatedAt,
        createdAt,
        stepId,
        destination,
      ];
}

class AlphaDestinationUpdateRoute extends Equatable {
  const AlphaDestinationUpdateRoute({
    required this.name,
    required this.address,
    required this.village,
    required this.district,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    required this.createdAt,
    required this.locationId,
  });

  final String? name;
  final String? address;
  final String? village;
  final String? district;
  final int? latitude;
  final int? longitude;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? locationId;

  @override
  List<Object?> get props => [
        name,
        address,
        village,
        district,
        latitude,
        longitude,
        updatedAt,
        createdAt,
        locationId,
      ];
}
