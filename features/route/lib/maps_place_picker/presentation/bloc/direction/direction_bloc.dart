import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/direction_body.dart';
import '../../../domain/entities/direction_entity.dart';
import '../../../domain/usecases/direction_use_case.dart';

part 'direction_event.dart';
part 'direction_state.dart';

class DirectionBloc extends Bloc<DirectionEvent, DirectionState> {
  final DirectionUseCase useCase;

  DirectionBloc({
    required this.useCase,
  }) : super(DirectionInitial()) {
    on<FetchDirection>((event, emit) async {
      emit(DirectionLoading());
      final result = await useCase(event.body);
      emit(
        result.fold(
          (failure) => DirectionFailed(failure),
          (success) => DirectionSuccess(success),
        ),
      );
    });
  }
}
