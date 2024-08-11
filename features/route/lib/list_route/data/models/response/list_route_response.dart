import 'dart:convert';

import 'package:core/core.dart';

class ListRouteResponse extends Equatable {
  const ListRouteResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataListRoute? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory ListRouteResponse.fromMap(Map<String, dynamic> map) {
    return ListRouteResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataListRoute.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListRouteResponse.fromJson(String source) =>
      ListRouteResponse.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((e) => e.toMap()).toList(),
      'total': total,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
    };
  }

  factory DataListRoute.fromMap(Map<String, dynamic> map) {
    return DataListRoute(
      data: map['data'] == null
          ? null
          : List.from(
              (map['data'] as List).map((e) => AlphaDataListRoute.fromMap(e))),
      total: int.tryParse(map['total']?.toString() ?? ''),
      perPage: int.tryParse(map['per_page']?.toString() ?? ''),
      currentPage: int.tryParse(map['current_page']?.toString() ?? ''),
      lastPage: int.tryParse(map['last_page']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataListRoute.fromJson(String source) =>
      DataListRoute.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'route_id': routeId,
      'total_distance': totalDistance,
      'total_duration': totalDuration,
      'origin_location_id': originLocationId,
      'destination_location_id': destinationLocationId,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt,
      'origin': origin?.toMap(),
      'destination': destination?.toMap(),
    };
  }

  factory AlphaDataListRoute.fromMap(Map<String, dynamic> map) {
    return AlphaDataListRoute(
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
      totalDistance: int.tryParse(map['total_distance']?.toString() ?? ''),
      totalDuration: int.tryParse(map['total_duration']?.toString() ?? ''),
      originLocationId:
          int.tryParse(map['origin_location_id']?.toString() ?? ''),
      destinationLocationId:
          int.tryParse(map['destination_location_id']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: map['deleted_at'],
      origin:
          map['origin'] == null ? null : OriginListRoute.fromMap(map['origin']),
      destination: map['destination'] == null
          ? null
          : DestinationListRoute.fromMap(map['destination']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaDataListRoute.fromJson(String source) =>
      AlphaDataListRoute.fromMap(json.decode(source));

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

  factory OriginListRoute.fromMap(Map<String, dynamic> map) {
    return OriginListRoute(
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

  factory OriginListRoute.fromJson(String source) =>
      OriginListRoute.fromMap(json.decode(source));

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

  factory DestinationListRoute.fromMap(Map<String, dynamic> map) {
    return DestinationListRoute(
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

  factory DestinationListRoute.fromJson(String source) =>
      DestinationListRoute.fromMap(json.decode(source));

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
