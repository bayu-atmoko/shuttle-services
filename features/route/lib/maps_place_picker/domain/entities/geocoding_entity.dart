import 'package:core/core.dart';

class GeocodingEntity extends Equatable {
  const GeocodingEntity({
    required this.results,
    required this.status,
  });

  final List<ResultsGeocoding>? results;
  final String? status;

  @override
  List<Object?> get props => [
        results,
        status,
      ];
}

class ResultsGeocoding extends Equatable {
  const ResultsGeocoding({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    required this.plusCode,
    required this.types,
  });

  final List<AddressComponentsGeocoding>? addressComponents;
  final String? formattedAddress;
  final GeometryGeocoding? geometry;
  final String? placeId;
  final PlusCodeGeocoding? plusCode;
  final List<String>? types;

  @override
  List<Object?> get props => [
        addressComponents,
        formattedAddress,
        geometry,
        placeId,
        plusCode,
        types,
      ];
}

class GeometryGeocoding extends Equatable {
  const GeometryGeocoding({
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  final LocationGeocoding? location;
  final String? locationType;
  final ViewportGeocoding? viewport;

  @override
  List<Object?> get props => [
        location,
        locationType,
        viewport,
      ];
}

class LocationGeocoding extends Equatable {
  const LocationGeocoding({
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

class ViewportGeocoding extends Equatable {
  const ViewportGeocoding({
    required this.northeast,
    required this.southwest,
  });

  final NortheastGeocoding? northeast;
  final SouthwestGeocoding? southwest;

  @override
  List<Object?> get props => [
        northeast,
        southwest,
      ];
}

class NortheastGeocoding extends Equatable {
  const NortheastGeocoding({
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

class SouthwestGeocoding extends Equatable {
  const SouthwestGeocoding({
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

class PlusCodeGeocoding extends Equatable {
  const PlusCodeGeocoding({
    required this.compoundCode,
    required this.globalCode,
  });

  final String? compoundCode;
  final String? globalCode;

  @override
  List<Object?> get props => [
        compoundCode,
        globalCode,
      ];
}

class AddressComponentsGeocoding extends Equatable {
  const AddressComponentsGeocoding({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  final String? longName;
  final String? shortName;
  final List<String>? types;

  @override
  List<Object?> get props => [
        longName,
        shortName,
        types,
      ];
}
