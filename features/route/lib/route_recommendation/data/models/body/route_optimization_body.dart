import 'package:core/core.dart';

class RouteOptimizationBody extends Equatable {
  const RouteOptimizationBody({
    required this.rows,
  });

  final List<RowsRouteOptimization>? rows;

  Map<String, dynamic> toMap() {
    return {
      if (rows != null) 'rows': rows?.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        rows,
      ];
}

class RowsRouteOptimization extends Equatable {
  const RowsRouteOptimization({
    required this.elements,
  });

  final List<ElementsRouteOptimization>? elements;

  Map<String, dynamic> toMap() {
    return {
      if (elements != null)
        'elements': elements?.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        elements,
      ];
}

class ElementsRouteOptimization extends Equatable {
  const ElementsRouteOptimization({
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
