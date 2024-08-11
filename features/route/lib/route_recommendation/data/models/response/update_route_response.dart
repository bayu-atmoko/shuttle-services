import 'dart:convert';

import 'package:core/core.dart';

class UpdateRouteResponse extends Equatable {
  const UpdateRouteResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataUpdateRoute? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory UpdateRouteResponse.fromMap(Map<String, dynamic> map) {
    return UpdateRouteResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataUpdateRoute.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateRouteResponse.fromJson(String source) =>
      UpdateRouteResponse.fromMap(json.decode(source));

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

  factory DataUpdateRoute.fromMap(Map<String, dynamic> map) {
    return DataUpdateRoute(
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
      totalDistance: int.tryParse(map['total_distance']?.toString() ?? ''),
      totalDuration: int.tryParse(map['total_duration']?.toString() ?? ''),
      origin: map['origin'] == null
          ? null
          : OriginUpdateRoute.fromMap(map['origin']),
      destination: map['destination'] == null
          ? null
          : DestinationUpdateRoute.fromMap(map['destination']),
      step: map['step'] == null
          ? null
          : List.from(
              (map['step'] as List).map((e) => StepUpdateRoute.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataUpdateRoute.fromJson(String source) =>
      DataUpdateRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'village': village,
      'district': district,
      'latitude': latitude,
      'longitude': longitude,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'location_id': locationId,
    };
  }

  factory OriginUpdateRoute.fromMap(Map<String, dynamic> map) {
    return OriginUpdateRoute(
      name: map['name'],
      address: map['address'],
      village: map['village'],
      district: map['district'],
      latitude: int.tryParse(map['latitude']?.toString() ?? ''),
      longitude: int.tryParse(map['longitude']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginUpdateRoute.fromJson(String source) =>
      OriginUpdateRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'village': village,
      'district': district,
      'latitude': latitude,
      'longitude': longitude,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'location_id': locationId,
    };
  }

  factory DestinationUpdateRoute.fromMap(Map<String, dynamic> map) {
    return DestinationUpdateRoute(
      name: map['name'],
      address: map['address'],
      village: map['village'],
      district: map['district'],
      latitude: int.tryParse(map['latitude']?.toString() ?? ''),
      longitude: int.tryParse(map['longitude']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DestinationUpdateRoute.fromJson(String source) =>
      DestinationUpdateRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'route_id': routeId,
      'step_number': stepNumber,
      'distance': distance,
      'duration': duration,
      'destination_location_id': destinationLocationId,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'step_id': stepId,
      'destination': destination?.toMap(),
    };
  }

  factory StepUpdateRoute.fromMap(Map<String, dynamic> map) {
    return StepUpdateRoute(
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
      stepNumber: int.tryParse(map['step_number']?.toString() ?? ''),
      distance: int.tryParse(map['distance']?.toString() ?? ''),
      duration: int.tryParse(map['duration']?.toString() ?? ''),
      destinationLocationId:
          int.tryParse(map['destination_location_id']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      stepId: int.tryParse(map['step_id']?.toString() ?? ''),
      destination: map['destination'] == null
          ? null
          : AlphaDestinationUpdateRoute.fromMap(map['destination']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StepUpdateRoute.fromJson(String source) =>
      StepUpdateRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'village': village,
      'district': district,
      'latitude': latitude,
      'longitude': longitude,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'location_id': locationId,
    };
  }

  factory AlphaDestinationUpdateRoute.fromMap(Map<String, dynamic> map) {
    return AlphaDestinationUpdateRoute(
      name: map['name'],
      address: map['address'],
      village: map['village'],
      district: map['district'],
      latitude: int.tryParse(map['latitude']?.toString() ?? ''),
      longitude: int.tryParse(map['longitude']?.toString() ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaDestinationUpdateRoute.fromJson(String source) =>
      AlphaDestinationUpdateRoute.fromMap(json.decode(source));

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
