import 'dart:convert';

import 'package:core/core.dart';

class DetailRouteResponse extends Equatable {
  const DetailRouteResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataDetailRoute? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory DetailRouteResponse.fromMap(Map<String, dynamic> map) {
    return DetailRouteResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataDetailRoute.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailRouteResponse.fromJson(String source) =>
      DetailRouteResponse.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'route_id': routeId,
      'total_distance': totalDistance,
      'total_duration': totalDuration,
      'origin': origin?.toMap(),
      'destination': destination?.toMap(),
      'step': step?.map((e) => e.toMap()).toList(),
    };
  }

  factory DataDetailRoute.fromMap(Map<String, dynamic> map) {
    return DataDetailRoute(
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
      totalDistance: int.tryParse(map['total_distance']?.toString() ?? ''),
      totalDuration: int.tryParse(map['total_duration']?.toString() ?? ''),
      origin: map['origin'] == null
          ? null
          : OriginDetailRoute.fromMap(map['origin']),
      destination: map['destination'] == null
          ? null
          : DestinationDetailRoute.fromMap(map['destination']),
      step: map['step'] == null
          ? null
          : List.from(
              (map['step'] as List).map((e) => StepDetailRoute.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataDetailRoute.fromJson(String source) =>
      DataDetailRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt,
      'district': district,
      'village': village,
    };
  }

  factory OriginDetailRoute.fromMap(Map<String, dynamic> map) {
    return OriginDetailRoute(
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      name: map['name'],
      address: map['address'],
      latitude: int.tryParse(map['latitude']?.toString() ?? ''),
      longitude: int.tryParse(map['longitude']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: map['deleted_at'],
      district: map['district'],
      village: map['village'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginDetailRoute.fromJson(String source) =>
      OriginDetailRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt,
      'district': district,
      'village': village,
    };
  }

  factory DestinationDetailRoute.fromMap(Map<String, dynamic> map) {
    return DestinationDetailRoute(
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      name: map['name'],
      address: map['address'],
      latitude: int.tryParse(map['latitude']?.toString() ?? ''),
      longitude: int.tryParse(map['longitude']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: map['deleted_at'],
      district: map['district'],
      village: map['village'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DestinationDetailRoute.fromJson(String source) =>
      DestinationDetailRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'step_id': stepId,
      'route_id': routeId,
      'step_number': stepNumber,
      'distance': distance,
      'duration': duration,
      'destination_location_id': destinationLocationId,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt,
      'destination': destination?.toMap(),
    };
  }

  factory StepDetailRoute.fromMap(Map<String, dynamic> map) {
    return StepDetailRoute(
      stepId: int.tryParse(map['step_id']?.toString() ?? ''),
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
      stepNumber: int.tryParse(map['step_number']?.toString() ?? ''),
      distance: int.tryParse(map['distance']?.toString() ?? ''),
      duration: int.tryParse(map['duration']?.toString() ?? ''),
      destinationLocationId:
          int.tryParse(map['destination_location_id']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: map['deleted_at'],
      destination: map['destination'] == null
          ? null
          : AlphaDestinationDetailRoute.fromMap(map['destination']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StepDetailRoute.fromJson(String source) =>
      StepDetailRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt,
      'district': district,
      'village': village,
    };
  }

  factory AlphaDestinationDetailRoute.fromMap(Map<String, dynamic> map) {
    return AlphaDestinationDetailRoute(
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      name: map['name'],
      address: map['address'],
      latitude: int.tryParse(map['latitude']?.toString() ?? ''),
      longitude: int.tryParse(map['longitude']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: map['deleted_at'],
      district: map['district'],
      village: map['village'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaDestinationDetailRoute.fromJson(String source) =>
      AlphaDestinationDetailRoute.fromMap(json.decode(source));

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
