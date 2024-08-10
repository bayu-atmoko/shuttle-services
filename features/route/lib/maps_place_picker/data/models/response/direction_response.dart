import 'dart:convert';

import 'package:core/core.dart';

class DirectionResponse extends Equatable {
  const DirectionResponse({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });

  final List<GeocodedWaypointsDirection>? geocodedWaypoints;
  final List<RoutesDirection>? routes;
  final String? status;

  Map<String, dynamic> toMap() {
    return {
      'geocoded_waypoints': geocodedWaypoints?.map((e) => e.toMap()).toList(),
      'routes': routes?.map((e) => e.toMap()).toList(),
      'status': status,
    };
  }

  factory DirectionResponse.fromMap(Map<String, dynamic> map) {
    return DirectionResponse(
      geocodedWaypoints: map['geocoded_waypoints'] == null
          ? null
          : List.from((map['geocoded_waypoints'] as List)
              .map((e) => GeocodedWaypointsDirection.fromMap(e))),
      routes: map['routes'] == null
          ? null
          : List.from(
              (map['routes'] as List).map((e) => RoutesDirection.fromMap(e))),
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectionResponse.fromJson(String source) =>
      DirectionResponse.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'geocoder_status': geocoderStatus,
      'place_id': placeId,
      'types': types,
    };
  }

  factory GeocodedWaypointsDirection.fromMap(Map<String, dynamic> map) {
    return GeocodedWaypointsDirection(
      geocoderStatus: map['geocoder_status'],
      placeId: map['place_id'],
      types: map['types'] == null ? null : List.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeocodedWaypointsDirection.fromJson(String source) =>
      GeocodedWaypointsDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'bounds': bounds?.toMap(),
      'copyrights': copyrights,
      'legs': legs?.map((e) => e.toMap()).toList(),
      'overview_polyline': overviewPolyline?.toMap(),
      'summary': summary,
      'warnings': warnings,
      'waypoint_order': waypointOrder,
    };
  }

  factory RoutesDirection.fromMap(Map<String, dynamic> map) {
    return RoutesDirection(
      bounds:
          map['bounds'] == null ? null : BoundsDirection.fromMap(map['bounds']),
      copyrights: map['copyrights'],
      legs: map['legs'] == null
          ? null
          : List.from(
              (map['legs'] as List).map((e) => LegsDirection.fromMap(e))),
      overviewPolyline: map['overview_polyline'] == null
          ? null
          : OverviewPolylineDirection.fromMap(map['overview_polyline']),
      summary: map['summary'],
      warnings: map['warnings'],
      waypointOrder: map['waypoint_order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutesDirection.fromJson(String source) =>
      RoutesDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'northeast': northeast?.toMap(),
      'southwest': southwest?.toMap(),
    };
  }

  factory BoundsDirection.fromMap(Map<String, dynamic> map) {
    return BoundsDirection(
      northeast: map['northeast'] == null
          ? null
          : NortheastDirection.fromMap(map['northeast']),
      southwest: map['southwest'] == null
          ? null
          : SouthwestDirection.fromMap(map['southwest']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoundsDirection.fromJson(String source) =>
      BoundsDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory NortheastDirection.fromMap(Map<String, dynamic> map) {
    return NortheastDirection(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory NortheastDirection.fromJson(String source) =>
      NortheastDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory SouthwestDirection.fromMap(Map<String, dynamic> map) {
    return SouthwestDirection(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory SouthwestDirection.fromJson(String source) =>
      SouthwestDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }

  factory OverviewPolylineDirection.fromMap(Map<String, dynamic> map) {
    return OverviewPolylineDirection(
      points: map['points'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OverviewPolylineDirection.fromJson(String source) =>
      OverviewPolylineDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'distance': distance?.toMap(),
      'duration': duration?.toMap(),
      'end_address': endAddress,
      'end_location': endLocation?.toMap(),
      'start_address': startAddress,
      'start_location': startLocation?.toMap(),
      'traffic_speed_entry': trafficSpeedEntry,
      'via_waypoint': viaWaypoint,
    };
  }

  factory LegsDirection.fromMap(Map<String, dynamic> map) {
    return LegsDirection(
      distance: map['distance'] == null
          ? null
          : DistanceDirection.fromMap(map['distance']),
      duration: map['duration'] == null
          ? null
          : DurationDirection.fromMap(map['duration']),
      endAddress: map['end_address'],
      endLocation: map['end_location'] == null
          ? null
          : EndLocationDirection.fromMap(map['end_location']),
      startAddress: map['start_address'],
      startLocation: map['start_location'] == null
          ? null
          : StartLocationDirection.fromMap(map['start_location']),
      trafficSpeedEntry: map['traffic_speed_entry'],
      viaWaypoint: map['via_waypoint'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LegsDirection.fromJson(String source) =>
      LegsDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'value': value,
    };
  }

  factory DistanceDirection.fromMap(Map<String, dynamic> map) {
    return DistanceDirection(
      text: map['text'],
      value: int.tryParse(map['value']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DistanceDirection.fromJson(String source) =>
      DistanceDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'value': value,
    };
  }

  factory DurationDirection.fromMap(Map<String, dynamic> map) {
    return DurationDirection(
      text: map['text'],
      value: int.tryParse(map['value']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DurationDirection.fromJson(String source) =>
      DurationDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory EndLocationDirection.fromMap(Map<String, dynamic> map) {
    return EndLocationDirection(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory EndLocationDirection.fromJson(String source) =>
      EndLocationDirection.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory StartLocationDirection.fromMap(Map<String, dynamic> map) {
    return StartLocationDirection(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory StartLocationDirection.fromJson(String source) =>
      StartLocationDirection.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}
