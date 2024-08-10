import 'package:core/core.dart';

class MapRoutesEntity extends Equatable {
  const MapRoutesEntity({
    required this.routes,
  });

  final List<RoutesMapRoutes>? routes;

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

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
