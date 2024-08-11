import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/update_route_body.dart';
import '../../../domain/entities/update_route_entity.dart';
import '../../../domain/usecases/update_route_use_case.dart';

part 'update_route_event.dart';
part 'update_route_state.dart';

class UpdateRouteBloc extends Bloc<UpdateRouteEvent, UpdateRouteState> {
  final UpdateRouteUseCase useCase;

  UpdateRouteBloc({
    required this.useCase,
  }) : super(UpdateRouteInitial()) {
    on<FetchUpdateRoute>((event, emit) async {
      emit(UpdateRouteLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => UpdateRouteFailed(
              event.body, event.headers, failure, event.extra),
          (success) => UpdateRouteSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
