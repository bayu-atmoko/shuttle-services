import 'package:core/core.dart';

class ListRouteEntity extends Equatable {
  const ListRouteEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataListRoute? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataListRoute extends Equatable {
  const DataListRoute({
    required this.data,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  final List<AlphaDataListRoute>? data;
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  @override
  List<Object?> get props => [
        data,
        total,
        perPage,
        currentPage,
        lastPage,
      ];
}

class AlphaDataListRoute extends Equatable {
  const AlphaDataListRoute({
    required this.routeId,
    required this.totalDistance,
    required this.totalDuration,
    required this.originLocationId,
    required this.destinationLocationId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.origin,
    required this.destination,
  });

  final int? routeId;
  final int? totalDistance;
  final int? totalDuration;
  final int? originLocationId;
  final int? destinationLocationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final OriginListRoute? origin;
  final DestinationListRoute? destination;

  @override
  List<Object?> get props => [
        routeId,
        totalDistance,
        totalDuration,
        originLocationId,
        destinationLocationId,
        createdAt,
        updatedAt,
        deletedAt,
        origin,
        destination,
      ];
}

class OriginListRoute extends Equatable {
  const OriginListRoute({
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

class DestinationListRoute extends Equatable {
  const DestinationListRoute({
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
