import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/edit_profile_body.dart';
import '../../../domain/entities/edit_profile_entity.dart';
import '../../../domain/usecases/edit_profile_use_case.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUseCase useCase;

  EditProfileBloc({
    required this.useCase,
  }) : super(EditProfileInitial()) {
    on<FetchEditProfile>((event, emit) async {
      emit(EditProfileLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => EditProfileFailed(
              event.body, event.headers, failure, event.extra),
          (success) => EditProfileSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
