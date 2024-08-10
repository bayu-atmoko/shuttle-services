import 'package:core/core.dart';

class DirectionEntity extends Equatable {
  const DirectionEntity({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });

  final List<GeocodedWaypointsDirection>? geocodedWaypoints;
  final List<RoutesDirection>? routes;
  final String? status;

  @override
  List<Object?> get props => [
        geocodedWaypoints,
        routes,
        status,
      ];
}

class GeocodedWaypointsDirection extends Equatable {
  const GeocodedWaypointsDirection({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });

  final String? geocoderStatus;
  final String? placeId;
  final List<String>? types;

  @override
  List<Object?> get props => [
        geocoderStatus,
        placeId,
        types,
      ];
}

class RoutesDirection extends Equatable {
  const RoutesDirection({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });

  final BoundsDirection? bounds;
  final String? copyrights;
  final List<LegsDirection>? legs;
  final OverviewPolylineDirection? overviewPolyline;
  final String? summary;
  final List<dynamic>? warnings;
  final List<dynamic>? waypointOrder;

  @override
  List<Object?> get props => [
        bounds,
        copyrights,
        legs,
        overviewPolyline,
        summary,
        warnings,
        waypointOrder,
      ];
}

class BoundsDirection extends Equatable {
  const BoundsDirection({
    required this.northeast,
    required this.southwest,
  });

  final NortheastDirection? northeast;
  final SouthwestDirection? southwest;

  @override
  List<Object?> get props => [
        northeast,
        southwest,
      ];
}

class NortheastDirection extends Equatable {
  const NortheastDirection({
    required this.lat,
    required this.lng,
  });

  final double? lat;
  final double? lng;

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}

class SouthwestDirection extends Equatable {
  const SouthwestDirection({
    required this.lat,
    required this.lng,
  });

  final double? lat;
  final double? lng;

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}

class OverviewPolylineDirection extends Equatable {
  const OverviewPolylineDirection({
    required this.points,
  });

  final String? points;

  @override
  List<Object?> get props => [
        points,
      ];
}

class LegsDirection extends Equatable {
  const LegsDirection({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });

  final DistanceDirection? distance;
  final DurationDirection? duration;
  final String? endAddress;
  final EndLocationDirection? endLocation;
  final String? startAddress;
  final StartLocationDirection? startLocation;
  final List<dynamic>? trafficSpeedEntry;
  final List<dynamic>? viaWaypoint;

  @override
  List<Object?> get props => [
        distance,
        duration,
        endAddress,
        endLocation,
        startAddress,
        startLocation,
        trafficSpeedEntry,
        viaWaypoint,
      ];
}

class DistanceDirection extends Equatable {
  const DistanceDirection({
    required this.text,
    required this.value,
  });

  final String? text;
  final int? value;

  @override
  List<Object?> get props => [
        text,
        value,
      ];
}

class DurationDirection extends Equatable {
  const DurationDirection({
    required this.text,
    required this.value,
  });

  final String? text;
  final int? value;

  @override
  List<Object?> get props => [
        text,
        value,
      ];
}

class EndLocationDirection extends Equatable {
  const EndLocationDirection({
    required this.lat,
    required this.lng,
  });

  final double? lat;
  final double? lng;

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}

class StartLocationDirection extends Equatable {
  const StartLocationDirection({
    required this.lat,
    required this.lng,
  });

  final double? lat;
  final double? lng;

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}
