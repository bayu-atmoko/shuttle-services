import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/detail_route_body.dart';
import '../../../domain/entities/detail_route_entity.dart';
import '../../../domain/usecases/detail_route_use_case.dart';

part 'detail_route_event.dart';
part 'detail_route_state.dart';

class DetailRouteBloc extends Bloc<DetailRouteEvent, DetailRouteState> {
  final DetailRouteUseCase useCase;

  DetailRouteBloc({
    required this.useCase,
  }) : super(DetailRouteInitial()) {
    on<FetchDetailRoute>((event, emit) async {
      emit(DetailRouteLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => DetailRouteFailed(
              event.body, event.headers, failure, event.extra),
          (success) => DetailRouteSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
