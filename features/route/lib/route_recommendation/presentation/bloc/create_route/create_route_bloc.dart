import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/create_route_body.dart';
import '../../../domain/entities/create_route_entity.dart';
import '../../../domain/usecases/create_route_use_case.dart';

part 'create_route_event.dart';
part 'create_route_state.dart';

class CreateRouteBloc extends Bloc<CreateRouteEvent, CreateRouteState> {
  final CreateRouteUseCase useCase;

  CreateRouteBloc({
    required this.useCase,
  }) : super(CreateRouteInitial()) {
    on<FetchCreateRoute>((event, emit) async {
      emit(CreateRouteLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => CreateRouteFailed(
              event.body, event.headers, failure, event.extra),
          (success) => CreateRouteSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
