import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/geocoding_body.dart';
import '../../../domain/entities/geocoding_entity.dart';
import '../../../domain/usecases/geocoding_use_case.dart';

part 'geocoding_event.dart';
part 'geocoding_state.dart';

class GeocodingBloc extends Bloc<GeocodingEvent, GeocodingState> {
  final GeocodingUseCase useCase;

  GeocodingBloc({
    required this.useCase,
  }) : super(GeocodingInitial()) {
    on<FetchGeocoding>((event, emit) async {
      emit(GeocodingLoading());
      final result = await useCase(event.body);
      emit(
        result.fold(
          (failure) => GeocodingFailed(failure),
          (success) => GeocodingSuccess(success),
        ),
      );
    });
  }
}
