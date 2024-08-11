import 'dart:convert';

import 'package:core/core.dart';

class RouteOptimizationResponse extends Equatable {
  const RouteOptimizationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<DataRouteOptimization>? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.map((e) => e.toMap()).toList(),
    };
  }

  factory RouteOptimizationResponse.fromMap(Map<String, dynamic> map) {
    return RouteOptimizationResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null
          ? null
          : List.from((map['data'] as List)
              .map((e) => DataRouteOptimization.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RouteOptimizationResponse.fromJson(String source) =>
      RouteOptimizationResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataRouteOptimization extends Equatable {
  const DataRouteOptimization({
    required this.originReportId,
    required this.destinationReportId,
    required this.duration,
    required this.distance,
  });

  final int? originReportId;
  final int? destinationReportId;
  final int? duration;
  final int? distance;

  Map<String, dynamic> toMap() {
    return {
      'origin_report_id': originReportId,
      'destination_report_id': destinationReportId,
      'duration': duration,
      'distance': distance,
    };
  }

  factory DataRouteOptimization.fromMap(Map<String, dynamic> map) {
    return DataRouteOptimization(
      originReportId: int.tryParse(map['origin_report_id']?.toString() ?? ''),
      destinationReportId:
          int.tryParse(map['destination_report_id']?.toString() ?? ''),
      duration: int.tryParse(map['duration']?.toString() ?? ''),
      distance: int.tryParse(map['distance']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataRouteOptimization.fromJson(String source) =>
      DataRouteOptimization.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        originReportId,
        destinationReportId,
        duration,
        distance,
      ];
}
