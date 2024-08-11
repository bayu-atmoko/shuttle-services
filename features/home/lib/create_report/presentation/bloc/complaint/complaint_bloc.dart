import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/complaint_body.dart';
import '../../../domain/entities/complaint_entity.dart';
import '../../../domain/usecases/complaint_use_case.dart';

part 'complaint_event.dart';
part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  final ComplaintUseCase useCase;

  ComplaintBloc({
    required this.useCase,
  }) : super(ComplaintInitial()) {
    on<FetchComplaint>((event, emit) async {
      emit(ComplaintLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              ComplaintFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              ComplaintSuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
