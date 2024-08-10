import 'dart:convert';

import 'package:core/core.dart';

class PlaceAutocompleteResponse extends Equatable {
  const PlaceAutocompleteResponse({
    required this.predictions,
    required this.status,
  });

  final List<PredictionsPlaceAutocomplete>? predictions;
  final String? status;

  Map<String, dynamic> toMap() {
    return {
      'predictions': predictions?.map((e) => e.toMap()).toList(),
      'status': status,
    };
  }

  factory PlaceAutocompleteResponse.fromMap(Map<String, dynamic> map) {
    return PlaceAutocompleteResponse(
      predictions: map['predictions'] == null
          ? null
          : List.from((map['predictions'] as List)
              .map((e) => PredictionsPlaceAutocomplete.fromMap(e))),
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceAutocompleteResponse.fromJson(String source) =>
      PlaceAutocompleteResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        predictions,
        status,
      ];
}

class PredictionsPlaceAutocomplete extends Equatable {
  const PredictionsPlaceAutocomplete({
    required this.description,
    required this.distanceMeters,
    required this.matchedSubstrings,
    required this.placeId,
    required this.reference,
    required this.structuredFormatting,
    required this.terms,
    required this.types,
  });

  final String? description;
  final int? distanceMeters;
  final List<MatchedSubstringsPlaceAutocomplete>? matchedSubstrings;
  final String? placeId;
  final String? reference;
  final StructuredFormattingPlaceAutocomplete? structuredFormatting;
  final List<TermsPlaceAutocomplete>? terms;
  final List<String>? types;

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'distance_meters': distanceMeters,
      'matched_substrings': matchedSubstrings?.map((e) => e.toMap()).toList(),
      'place_id': placeId,
      'reference': reference,
      'structured_formatting': structuredFormatting?.toMap(),
      'terms': terms?.map((e) => e.toMap()).toList(),
      'types': types,
    };
  }

  factory PredictionsPlaceAutocomplete.fromMap(Map<String, dynamic> map) {
    return PredictionsPlaceAutocomplete(
      description: map['description'],
      distanceMeters: int.tryParse(map['distance_meters']?.toString() ?? ''),
      matchedSubstrings: map['matched_substrings'] == null
          ? null
          : List.from((map['matched_substrings'] as List)
              .map((e) => MatchedSubstringsPlaceAutocomplete.fromMap(e))),
      placeId: map['place_id'],
      reference: map['reference'],
      structuredFormatting: map['structured_formatting'] == null
          ? null
          : StructuredFormattingPlaceAutocomplete.fromMap(
              map['structured_formatting']),
      terms: map['terms'] == null
          ? null
          : List.from((map['terms'] as List)
              .map((e) => TermsPlaceAutocomplete.fromMap(e))),
      types: map['types'] == null ? null : List.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PredictionsPlaceAutocomplete.fromJson(String source) =>
      PredictionsPlaceAutocomplete.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        description,
        distanceMeters,
        matchedSubstrings,
        placeId,
        reference,
        structuredFormatting,
        terms,
        types,
      ];
}

class StructuredFormattingPlaceAutocomplete extends Equatable {
  const StructuredFormattingPlaceAutocomplete({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    required this.secondaryText,
  });

  final String? mainText;
  final List<MainTextMatchedSubstringsPlaceAutocomplete>?
      mainTextMatchedSubstrings;
  final String? secondaryText;

  Map<String, dynamic> toMap() {
    return {
      'main_text': mainText,
      'main_text_matched_substrings':
          mainTextMatchedSubstrings?.map((e) => e.toMap()).toList(),
      'secondary_text': secondaryText,
    };
  }

  factory StructuredFormattingPlaceAutocomplete.fromMap(
      Map<String, dynamic> map) {
    return StructuredFormattingPlaceAutocomplete(
      mainText: map['main_text'],
      mainTextMatchedSubstrings: map['main_text_matched_substrings'] == null
          ? null
          : List.from((map['main_text_matched_substrings'] as List).map(
              (e) => MainTextMatchedSubstringsPlaceAutocomplete.fromMap(e))),
      secondaryText: map['secondary_text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StructuredFormattingPlaceAutocomplete.fromJson(String source) =>
      StructuredFormattingPlaceAutocomplete.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        mainText,
        mainTextMatchedSubstrings,
        secondaryText,
      ];
}

class MainTextMatchedSubstringsPlaceAutocomplete extends Equatable {
  const MainTextMatchedSubstringsPlaceAutocomplete({
    required this.length,
    required this.offset,
  });

  final int? length;
  final int? offset;

  Map<String, dynamic> toMap() {
    return {
      'length': length,
      'offset': offset,
    };
  }

  factory MainTextMatchedSubstringsPlaceAutocomplete.fromMap(
      Map<String, dynamic> map) {
    return MainTextMatchedSubstringsPlaceAutocomplete(
      length: int.tryParse(map['length']?.toString() ?? ''),
      offset: int.tryParse(map['offset']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory MainTextMatchedSubstringsPlaceAutocomplete.fromJson(String source) =>
      MainTextMatchedSubstringsPlaceAutocomplete.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        length,
        offset,
      ];
}

class MatchedSubstringsPlaceAutocomplete extends Equatable {
  const MatchedSubstringsPlaceAutocomplete({
    required this.length,
    required this.offset,
  });

  final int? length;
  final int? offset;

  Map<String, dynamic> toMap() {
    return {
      'length': length,
      'offset': offset,
    };
  }

  factory MatchedSubstringsPlaceAutocomplete.fromMap(Map<String, dynamic> map) {
    return MatchedSubstringsPlaceAutocomplete(
      length: int.tryParse(map['length']?.toString() ?? ''),
      offset: int.tryParse(map['offset']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchedSubstringsPlaceAutocomplete.fromJson(String source) =>
      MatchedSubstringsPlaceAutocomplete.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        length,
        offset,
      ];
}

class TermsPlaceAutocomplete extends Equatable {
  const TermsPlaceAutocomplete({
    required this.offset,
    required this.value,
  });

  final int? offset;
  final String? value;

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'value': value,
    };
  }

  factory TermsPlaceAutocomplete.fromMap(Map<String, dynamic> map) {
    return TermsPlaceAutocomplete(
      offset: int.tryParse(map['offset']?.toString() ?? ''),
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TermsPlaceAutocomplete.fromJson(String source) =>
      TermsPlaceAutocomplete.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        offset,
        value,
      ];
}
