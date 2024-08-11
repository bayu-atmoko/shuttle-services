import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/profile_body.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../domain/usecases/profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase useCase;

  ProfileBloc({
    required this.useCase,
  }) : super(ProfileInitial()) {
    on<FetchProfile>((event, emit) async {
      emit(ProfileLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              ProfileFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              ProfileSuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
