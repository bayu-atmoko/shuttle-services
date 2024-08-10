import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/map/data/models/body/distance_matrix_body.dart';
import 'package:route/map/domain/entities/distance_matrix_entity.dart';
import 'package:route/map/domain/usecases/distance_matrix_use_case.dart';

part 'distance_matrix_event.dart';
part 'distance_matrix_state.dart';

class DistanceMatrixBloc
    extends Bloc<DistanceMatrixEvent, DistanceMatrixState> {
  final DistanceMatrixUseCase useCase;

  DistanceMatrixBloc({
    required this.useCase,
  }) : super(DistanceMatrixInitial()) {
    on<FetchDistanceMatrix>((event, emit) async {
      emit(DistanceMatrixLoading());
      final result = await useCase(event.body);
      emit(
        result.fold(
          (failure) => DistanceMatrixFailed(failure),
          (success) => DistanceMatrixSuccess(
            success,
            event.body,
          ),
        ),
      );
    });
  }
}
