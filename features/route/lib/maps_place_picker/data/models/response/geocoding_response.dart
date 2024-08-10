import 'dart:convert';

import 'package:core/core.dart';

class GeocodingResponse extends Equatable {
  const GeocodingResponse({
    required this.results,
    required this.status,
  });

  final List<ResultsGeocoding>? results;
  final String? status;

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((e) => e.toMap()).toList(),
      'status': status,
    };
  }

  factory GeocodingResponse.fromMap(Map<String, dynamic> map) {
    return GeocodingResponse(
      results: map['results'] == null
          ? null
          : List.from(
              (map['results'] as List).map((e) => ResultsGeocoding.fromMap(e))),
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GeocodingResponse.fromJson(String source) =>
      GeocodingResponse.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'address_components': addressComponents?.map((e) => e.toMap()).toList(),
      'formatted_address': formattedAddress,
      'geometry': geometry?.toMap(),
      'place_id': placeId,
      'plus_code': plusCode?.toMap(),
      'types': types,
    };
  }

  factory ResultsGeocoding.fromMap(Map<String, dynamic> map) {
    return ResultsGeocoding(
      addressComponents: map['address_components'] == null
          ? null
          : List.from((map['address_components'] as List)
              .map((e) => AddressComponentsGeocoding.fromMap(e))),
      formattedAddress: map['formatted_address'],
      geometry: map['geometry'] == null
          ? null
          : GeometryGeocoding.fromMap(map['geometry']),
      placeId: map['place_id'],
      plusCode: map['plus_code'] == null
          ? null
          : PlusCodeGeocoding.fromMap(map['plus_code']),
      types: map['types'] == null ? null : List.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultsGeocoding.fromJson(String source) =>
      ResultsGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'location': location?.toMap(),
      'location_type': locationType,
      'viewport': viewport?.toMap(),
    };
  }

  factory GeometryGeocoding.fromMap(Map<String, dynamic> map) {
    return GeometryGeocoding(
      location: map['location'] == null
          ? null
          : LocationGeocoding.fromMap(map['location']),
      locationType: map['location_type'],
      viewport: map['viewport'] == null
          ? null
          : ViewportGeocoding.fromMap(map['viewport']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeometryGeocoding.fromJson(String source) =>
      GeometryGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory LocationGeocoding.fromMap(Map<String, dynamic> map) {
    return LocationGeocoding(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationGeocoding.fromJson(String source) =>
      LocationGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'northeast': northeast?.toMap(),
      'southwest': southwest?.toMap(),
    };
  }

  factory ViewportGeocoding.fromMap(Map<String, dynamic> map) {
    return ViewportGeocoding(
      northeast: map['northeast'] == null
          ? null
          : NortheastGeocoding.fromMap(map['northeast']),
      southwest: map['southwest'] == null
          ? null
          : SouthwestGeocoding.fromMap(map['southwest']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewportGeocoding.fromJson(String source) =>
      ViewportGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory NortheastGeocoding.fromMap(Map<String, dynamic> map) {
    return NortheastGeocoding(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory NortheastGeocoding.fromJson(String source) =>
      NortheastGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory SouthwestGeocoding.fromMap(Map<String, dynamic> map) {
    return SouthwestGeocoding(
      lat: double.tryParse(map['lat']?.toString() ?? ''),
      lng: double.tryParse(map['lng']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory SouthwestGeocoding.fromJson(String source) =>
      SouthwestGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'compound_code': compoundCode,
      'global_code': globalCode,
    };
  }

  factory PlusCodeGeocoding.fromMap(Map<String, dynamic> map) {
    return PlusCodeGeocoding(
      compoundCode: map['compound_code'],
      globalCode: map['global_code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlusCodeGeocoding.fromJson(String source) =>
      PlusCodeGeocoding.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'long_name': longName,
      'short_name': shortName,
      'types': types,
    };
  }

  factory AddressComponentsGeocoding.fromMap(Map<String, dynamic> map) {
    return AddressComponentsGeocoding(
      longName: map['long_name'],
      shortName: map['short_name'],
      types: map['types'] == null ? null : List.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressComponentsGeocoding.fromJson(String source) =>
      AddressComponentsGeocoding.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        longName,
        shortName,
        types,
      ];
}
