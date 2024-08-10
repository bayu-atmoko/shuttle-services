import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/map_routes_body.dart';
import '../../../domain/entities/map_routes_entity.dart';
import '../../../domain/usecases/map_routes_use_case.dart';

part 'map_routes_event.dart';
part 'map_routes_state.dart';

class MapRoutesBloc extends Bloc<MapRoutesEvent, MapRoutesState> {
  final MapRoutesUseCase useCase;

  MapRoutesBloc({
    required this.useCase,
  }) : super(MapRoutesInitial()) {
    on<FetchMapRoutes>((event, emit) async {
      emit(MapRoutesLoading());
      final result = await useCase(event.body);
      emit(
        result.fold(
          (failure) => MapRoutesFailed(failure),
          (success) => MapRoutesSuccess(success),
        ),
      );
    });
  }
}
