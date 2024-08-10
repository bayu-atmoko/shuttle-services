import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/place_autocomplete_body.dart';
import '../../../domain/entities/place_autocomplete_entity.dart';
import '../../../domain/usecases/place_autocomplete_use_case.dart';

part 'place_autocomplete_event.dart';
part 'place_autocomplete_state.dart';

class PlaceAutocompleteBloc
    extends Bloc<PlaceAutocompleteEvent, PlaceAutocompleteState> {
  final PlaceAutocompleteUseCase useCase;

  PlaceAutocompleteBloc({
    required this.useCase,
  }) : super(PlaceAutocompleteInitial()) {
    on<FetchPlaceAutocomplete>((event, emit) async {
      emit(PlaceAutocompleteLoading());
      final result = await useCase(event.body);
      emit(
        result.fold(
          (failure) => PlaceAutocompleteFailed(failure),
          (success) => PlaceAutocompleteSuccess(success),
        ),
      );
    });
  }
}
