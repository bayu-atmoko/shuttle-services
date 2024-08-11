import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/route_optimization_body.dart';
import '../../../domain/entities/route_optimization_entity.dart';
import '../../../domain/usecases/route_optimization_use_case.dart';

part 'route_optimization_event.dart';
part 'route_optimization_state.dart';

class RouteOptimizationBloc
    extends Bloc<RouteOptimizationEvent, RouteOptimizationState> {
  final RouteOptimizationUseCase useCase;

  RouteOptimizationBloc({
    required this.useCase,
  }) : super(RouteOptimizationInitial()) {
    on<FetchRouteOptimization>((event, emit) async {
      emit(RouteOptimizationLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => RouteOptimizationFailed(
              event.body, event.headers, failure, event.extra),
          (success) => RouteOptimizationSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
