part of 'place_autocomplete_bloc.dart';

@immutable
abstract class PlaceAutocompleteEvent extends Equatable {}

class FetchPlaceAutocomplete extends PlaceAutocompleteEvent {
  FetchPlaceAutocomplete(this.body);

  final PlaceAutocompleteBody body;

  @override
  List<Object?> get props => [body];
}
