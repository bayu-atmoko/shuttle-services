import 'package:core/core.dart';

class PlaceAutocompleteEntity extends Equatable {
  const PlaceAutocompleteEntity({
    required this.predictions,
    required this.status,
  });

  final List<PredictionsPlaceAutocomplete>? predictions;
  final String? status;

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

  @override
  List<Object?> get props => [
        offset,
        value,
      ];
}
