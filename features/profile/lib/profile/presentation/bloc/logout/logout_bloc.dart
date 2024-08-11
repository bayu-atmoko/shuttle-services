import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/logout_body.dart';
import '../../../domain/entities/logout_entity.dart';
import '../../../domain/usecases/logout_use_case.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase useCase;

  LogoutBloc({
    required this.useCase,
  }) : super(LogoutInitial()) {
    on<FetchLogout>((event, emit) async {
      emit(LogoutLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              LogoutFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              LogoutSuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
