import 'package:core/core.dart';

class RouteOptimizationEntity extends Equatable {
  const RouteOptimizationEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<DataRouteOptimization>? data;

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
      if (originReportId != null) 'origin_report_id': originReportId,
      if (destinationReportId != null)
        'destination_report_id': destinationReportId,
      if (duration != null) 'duration': duration,
      if (distance != null) 'distance': distance,
    };
  }

  @override
  List<Object?> get props => [
        originReportId,
        destinationReportId,
        duration,
        distance,
      ];
}
