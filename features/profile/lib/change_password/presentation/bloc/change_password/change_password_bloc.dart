import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/change_password_body.dart';
import '../../../domain/entities/change_password_entity.dart';
import '../../../domain/usecases/change_password_use_case.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase useCase;

  ChangePasswordBloc({
    required this.useCase,
  }) : super(ChangePasswordInitial()) {
    on<FetchChangePassword>((event, emit) async {
      emit(ChangePasswordLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => ChangePasswordFailed(
              event.body, event.headers, failure, event.extra),
          (success) => ChangePasswordSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
