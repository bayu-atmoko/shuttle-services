import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/list_route_body.dart';
import '../../../domain/entities/list_route_entity.dart';
import '../../../domain/usecases/list_route_use_case.dart';

part 'list_route_event.dart';
part 'list_route_state.dart';

class ListRouteBloc extends Bloc<ListRouteEvent, ListRouteState> {
  final ListRouteUseCase useCase;

  ListRouteBloc({
    required this.useCase,
  }) : super(ListRouteInitial()) {
    on<FetchListRoute>((event, emit) async {
      emit(ListRouteLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              ListRouteFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              ListRouteSuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
