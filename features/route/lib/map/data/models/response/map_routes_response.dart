import 'dart:convert';

import 'package:core/core.dart';

class MapRoutesResponse extends Equatable {
  const MapRoutesResponse({
    required this.routes,
  });

  final List<RoutesMapRoutes>? routes;

  Map<String, dynamic> toMap() {
    return {
      'routes': routes?.map((e) => e.toMap()).toList(),
    };
  }

  factory MapRoutesResponse.fromMap(Map<String, dynamic> map) {
    return MapRoutesResponse(
      routes: map['routes'] == null
          ? null
          : List.from(
              (map['routes'] as List).map((e) => RoutesMapRoutes.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MapRoutesResponse.fromJson(String source) =>
      MapRoutesResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        routes,
      ];
}

class RoutesMapRoutes extends Equatable {
  const RoutesMapRoutes({
    required this.routeLabels,
    required this.legs,
    required this.distanceMeters,
    required this.duration,
    required this.staticDuration,
    required this.polyline,
    required this.description,
    required this.warnings,
    required this.routeToken,
  });

  final List<String>? routeLabels;
  final List<LegsMapRoutes>? legs;
  final int? distanceMeters;
  final String? duration;
  final String? staticDuration;
  final PolylineMapRoutes? polyline;
  final String? description;
  final List<String>? warnings;
  final String? routeToken;

  Map<String, dynamic> toMap() {
    return {
      'routeLabels': routeLabels,
      'legs': legs?.map((e) => e.toMap()).toList(),
      'distanceMeters': distanceMeters,
      'duration': duration,
      'staticDuration': staticDuration,
      'polyline': polyline?.toMap(),
      'description': description,
      'warnings': warnings,
      'routeToken': routeToken,
    };
  }

  factory RoutesMapRoutes.fromMap(Map<String, dynamic> map) {
    return RoutesMapRoutes(
      routeLabels:
          map['routeLabels'] == null ? null : List.from(map['routeLabels']),
      legs: map['legs'] == null
          ? null
          : List.from(
              (map['legs'] as List).map((e) => LegsMapRoutes.fromMap(e))),
      distanceMeters: int.tryParse(map['distanceMeters']?.toString() ?? ''),
      duration: map['duration'],
      staticDuration: map['staticDuration'],
      polyline: map['polyline'] == null
          ? null
          : PolylineMapRoutes.fromMap(map['polyline']),
      description: map['description'],
      warnings: map['warnings'] == null ? null : List.from(map['warnings']),
      routeToken: map['routeToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutesMapRoutes.fromJson(String source) =>
      RoutesMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        routeLabels,
        legs,
        distanceMeters,
        duration,
        staticDuration,
        polyline,
        description,
        warnings,
        routeToken,
      ];
}

class PolylineMapRoutes extends Equatable {
  const PolylineMapRoutes({
    required this.encodedPolyline,
  });

  final String? encodedPolyline;

  Map<String, dynamic> toMap() {
    return {
      'encodedPolyline': encodedPolyline,
    };
  }

  factory PolylineMapRoutes.fromMap(Map<String, dynamic> map) {
    return PolylineMapRoutes(
      encodedPolyline: map['encodedPolyline'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PolylineMapRoutes.fromJson(String source) =>
      PolylineMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        encodedPolyline,
      ];
}

class LegsMapRoutes extends Equatable {
  const LegsMapRoutes({
    required this.distanceMeters,
    required this.duration,
    required this.staticDuration,
    required this.polyline,
    required this.startLocation,
    required this.endLocation,
    required this.steps,
  });

  final int? distanceMeters;
  final String? duration;
  final String? staticDuration;
  final AlphaPolylineMapRoutes? polyline;
  final StartLocationMapRoutes? startLocation;
  final EndLocationMapRoutes? endLocation;
  final List<StepsMapRoutes>? steps;

  Map<String, dynamic> toMap() {
    return {
      'distanceMeters': distanceMeters,
      'duration': duration,
      'staticDuration': staticDuration,
      'polyline': polyline?.toMap(),
      'startLocation': startLocation?.toMap(),
      'endLocation': endLocation?.toMap(),
      'steps': steps?.map((e) => e.toMap()).toList(),
    };
  }

  factory LegsMapRoutes.fromMap(Map<String, dynamic> map) {
    return LegsMapRoutes(
      distanceMeters: int.tryParse(map['distanceMeters']?.toString() ?? ''),
      duration: map['duration'],
      staticDuration: map['staticDuration'],
      polyline: map['polyline'] == null
          ? null
          : AlphaPolylineMapRoutes.fromMap(map['polyline']),
      startLocation: map['startLocation'] == null
          ? null
          : StartLocationMapRoutes.fromMap(map['startLocation']),
      endLocation: map['endLocation'] == null
          ? null
          : EndLocationMapRoutes.fromMap(map['endLocation']),
      steps: map['steps'] == null
          ? null
          : List.from(
              (map['steps'] as List).map((e) => StepsMapRoutes.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LegsMapRoutes.fromJson(String source) =>
      LegsMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        distanceMeters,
        duration,
        staticDuration,
        polyline,
        startLocation,
        endLocation,
        steps,
      ];
}

class AlphaPolylineMapRoutes extends Equatable {
  const AlphaPolylineMapRoutes({
    required this.encodedPolyline,
  });

  final String? encodedPolyline;

  Map<String, dynamic> toMap() {
    return {
      'encodedPolyline': encodedPolyline,
    };
  }

  factory AlphaPolylineMapRoutes.fromMap(Map<String, dynamic> map) {
    return AlphaPolylineMapRoutes(
      encodedPolyline: map['encodedPolyline'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaPolylineMapRoutes.fromJson(String source) =>
      AlphaPolylineMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        encodedPolyline,
      ];
}

class StartLocationMapRoutes extends Equatable {
  const StartLocationMapRoutes({
    required this.latLng,
    required this.heading,
  });

  final LatLngMapRoutes? latLng;
  final int? heading;

  Map<String, dynamic> toMap() {
    return {
      'latLng': latLng?.toMap(),
      'heading': heading,
    };
  }

  factory StartLocationMapRoutes.fromMap(Map<String, dynamic> map) {
    return StartLocationMapRoutes(
      latLng:
          map['latLng'] == null ? null : LatLngMapRoutes.fromMap(map['latLng']),
      heading: int.tryParse(map['heading']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory StartLocationMapRoutes.fromJson(String source) =>
      StartLocationMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latLng,
        heading,
      ];
}

class LatLngMapRoutes extends Equatable {
  const LatLngMapRoutes({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LatLngMapRoutes.fromMap(Map<String, dynamic> map) {
    return LatLngMapRoutes(
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLngMapRoutes.fromJson(String source) =>
      LatLngMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

class EndLocationMapRoutes extends Equatable {
  const EndLocationMapRoutes({
    required this.latLng,
    required this.heading,
  });

  final AlphaLatLngMapRoutes? latLng;
  final int? heading;

  Map<String, dynamic> toMap() {
    return {
      'latLng': latLng?.toMap(),
      'heading': heading,
    };
  }

  factory EndLocationMapRoutes.fromMap(Map<String, dynamic> map) {
    return EndLocationMapRoutes(
      latLng: map['latLng'] == null
          ? null
          : AlphaLatLngMapRoutes.fromMap(map['latLng']),
      heading: int.tryParse(map['heading']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory EndLocationMapRoutes.fromJson(String source) =>
      EndLocationMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latLng,
        heading,
      ];
}

class AlphaLatLngMapRoutes extends Equatable {
  const AlphaLatLngMapRoutes({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AlphaLatLngMapRoutes.fromMap(Map<String, dynamic> map) {
    return AlphaLatLngMapRoutes(
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaLatLngMapRoutes.fromJson(String source) =>
      AlphaLatLngMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

class StepsMapRoutes extends Equatable {
  const StepsMapRoutes({
    required this.distanceMeters,
    required this.staticDuration,
    required this.polyline,
    required this.startLocation,
    required this.endLocation,
  });

  final int? distanceMeters;
  final String? staticDuration;
  final BetaPolylineMapRoutes? polyline;
  final AlphaStartLocationMapRoutes? startLocation;
  final AlphaEndLocationMapRoutes? endLocation;

  Map<String, dynamic> toMap() {
    return {
      'distanceMeters': distanceMeters,
      'staticDuration': staticDuration,
      'polyline': polyline?.toMap(),
      'startLocation': startLocation?.toMap(),
      'endLocation': endLocation?.toMap(),
    };
  }

  factory StepsMapRoutes.fromMap(Map<String, dynamic> map) {
    return StepsMapRoutes(
      distanceMeters: int.tryParse(map['distanceMeters']?.toString() ?? ''),
      staticDuration: map['staticDuration'],
      polyline: map['polyline'] == null
          ? null
          : BetaPolylineMapRoutes.fromMap(map['polyline']),
      startLocation: map['startLocation'] == null
          ? null
          : AlphaStartLocationMapRoutes.fromMap(map['startLocation']),
      endLocation: map['endLocation'] == null
          ? null
          : AlphaEndLocationMapRoutes.fromMap(map['endLocation']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StepsMapRoutes.fromJson(String source) =>
      StepsMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        distanceMeters,
        staticDuration,
        polyline,
        startLocation,
        endLocation,
      ];
}

class BetaPolylineMapRoutes extends Equatable {
  const BetaPolylineMapRoutes({
    required this.encodedPolyline,
  });

  final String? encodedPolyline;

  Map<String, dynamic> toMap() {
    return {
      'encodedPolyline': encodedPolyline,
    };
  }

  factory BetaPolylineMapRoutes.fromMap(Map<String, dynamic> map) {
    return BetaPolylineMapRoutes(
      encodedPolyline: map['encodedPolyline'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BetaPolylineMapRoutes.fromJson(String source) =>
      BetaPolylineMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        encodedPolyline,
      ];
}

class AlphaStartLocationMapRoutes extends Equatable {
  const AlphaStartLocationMapRoutes({
    required this.latLng,
    required this.heading,
  });

  final BetaLatLngMapRoutes? latLng;
  final int? heading;

  Map<String, dynamic> toMap() {
    return {
      'latLng': latLng?.toMap(),
      'heading': heading,
    };
  }

  factory AlphaStartLocationMapRoutes.fromMap(Map<String, dynamic> map) {
    return AlphaStartLocationMapRoutes(
      latLng: map['latLng'] == null
          ? null
          : BetaLatLngMapRoutes.fromMap(map['latLng']),
      heading: int.tryParse(map['heading']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaStartLocationMapRoutes.fromJson(String source) =>
      AlphaStartLocationMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latLng,
        heading,
      ];
}

class BetaLatLngMapRoutes extends Equatable {
  const BetaLatLngMapRoutes({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory BetaLatLngMapRoutes.fromMap(Map<String, dynamic> map) {
    return BetaLatLngMapRoutes(
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory BetaLatLngMapRoutes.fromJson(String source) =>
      BetaLatLngMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

class AlphaEndLocationMapRoutes extends Equatable {
  const AlphaEndLocationMapRoutes({
    required this.latLng,
    required this.heading,
  });

  final GammaLatLngMapRoutes? latLng;
  final int? heading;

  Map<String, dynamic> toMap() {
    return {
      'latLng': latLng?.toMap(),
      'heading': heading,
    };
  }

  factory AlphaEndLocationMapRoutes.fromMap(Map<String, dynamic> map) {
    return AlphaEndLocationMapRoutes(
      latLng: map['latLng'] == null
          ? null
          : GammaLatLngMapRoutes.fromMap(map['latLng']),
      heading: int.tryParse(map['heading']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaEndLocationMapRoutes.fromJson(String source) =>
      AlphaEndLocationMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latLng,
        heading,
      ];
}

class GammaLatLngMapRoutes extends Equatable {
  const GammaLatLngMapRoutes({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GammaLatLngMapRoutes.fromMap(Map<String, dynamic> map) {
    return GammaLatLngMapRoutes(
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory GammaLatLngMapRoutes.fromJson(String source) =>
      GammaLatLngMapRoutes.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
