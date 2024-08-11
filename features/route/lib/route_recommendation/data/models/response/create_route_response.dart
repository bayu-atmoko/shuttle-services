import 'dart:convert';

import 'package:core/core.dart';

class CreateRouteResponse extends Equatable {
  const CreateRouteResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataCreateRoute? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory CreateRouteResponse.fromMap(Map<String, dynamic> map) {
    return CreateRouteResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataCreateRoute.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateRouteResponse.fromJson(String source) =>
      CreateRouteResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataCreateRoute extends Equatable {
  const DataCreateRoute({
    required this.routeId,
  });

  final int? routeId;

  Map<String, dynamic> toMap() {
    return {
      'route_id': routeId,
    };
  }

  factory DataCreateRoute.fromMap(Map<String, dynamic> map) {
    return DataCreateRoute(
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataCreateRoute.fromJson(String source) =>
      DataCreateRoute.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        routeId,
      ];
}
