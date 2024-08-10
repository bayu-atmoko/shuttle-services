import 'package:core/core.dart';

class MapRoutesBody extends Equatable {
  const MapRoutesBody({
    required this.origin,
    required this.destination,
    required this.intermediates,
    this.travelMode,
    this.routingPreference,
    this.departureTime,
    this.computeAlternativeRoutes,
    this.routeModifiers,
    this.languageCode,
    this.units,
  });

  final OriginMapRoutes? origin;
  final OriginMapRoutes? destination;
  final List<OriginMapRoutes>? intermediates;
  final String? travelMode;
  final String? routingPreference;
  final DateTime? departureTime;
  final bool? computeAlternativeRoutes;
  final RouteModifiersMapRoutes? routeModifiers;
  final String? languageCode;
  final String? units;

  Map<String, dynamic> toMap() {
    return {
      if (origin != null) 'origin': origin?.toMap(),
      if (destination != null) 'destination': destination?.toMap(),
      if (intermediates != null)
        'intermediates': intermediates?.map((e) => e.toMap()).toList(),
      if (travelMode != null) 'travelMode': travelMode,
      if (routingPreference != null) 'routingPreference': routingPreference,
      if (departureTime != null)
        'departureTime': departureTime?.toFormatDateTimeBody('yyyy-MM-dd'),
      if (computeAlternativeRoutes != null)
        'computeAlternativeRoutes': computeAlternativeRoutes,
      if (routeModifiers != null) 'routeModifiers': routeModifiers?.toMap(),
      if (languageCode != null) 'languageCode': languageCode,
      if (units != null) 'units': units,
    };
  }

  @override
  List<Object?> get props => [
        origin,
        destination,
        intermediates,
        travelMode,
        routingPreference,
        departureTime,
        computeAlternativeRoutes,
        routeModifiers,
        languageCode,
        units,
      ];
}

class OriginMapRoutes extends Equatable {
  const OriginMapRoutes({
    this.location,
  });

  final LocationMapRoutes? location;

  Map<String, dynamic> toMap() {
    return {
      if (location != null) 'location': location?.toMap(),
    };
  }

  @override
  List<Object?> get props => [
        location,
      ];
}

class LocationMapRoutes extends Equatable {
  const LocationMapRoutes({
    this.latLng,
  });

  final LatLngMapRoutes? latLng;

  Map<String, dynamic> toMap() {
    return {
      if (latLng != null) 'latLng': latLng?.toMap(),
    };
  }

  @override
  List<Object?> get props => [
        latLng,
      ];
}

class LatLngMapRoutes extends Equatable {
  const LatLngMapRoutes({
    this.latitude,
    this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

class AlphaLatLngMapRoutes extends Equatable {
  const AlphaLatLngMapRoutes({
    this.latitude,
    this.longitude,
  });

  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toMap() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

class RouteModifiersMapRoutes extends Equatable {
  const RouteModifiersMapRoutes({
    this.avoidTolls,
    this.avoidHighways,
    this.avoidFerries,
  });

  final bool? avoidTolls;
  final bool? avoidHighways;
  final bool? avoidFerries;

  Map<String, dynamic> toMap() {
    return {
      if (avoidTolls != null) 'avoidTolls': avoidTolls,
      if (avoidHighways != null) 'avoidHighways': avoidHighways,
      if (avoidFerries != null) 'avoidFerries': avoidFerries,
    };
  }

  @override
  List<Object?> get props => [
        avoidTolls,
        avoidHighways,
        avoidFerries,
      ];
}
