import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/create_report_body.dart';
import '../../../domain/entities/create_report_entity.dart';
import '../../../domain/usecases/create_report_use_case.dart';

part 'create_report_event.dart';
part 'create_report_state.dart';

class CreateReportBloc extends Bloc<CreateReportEvent, CreateReportState> {
  final CreateReportUseCase useCase;

  CreateReportBloc({
    required this.useCase,
  }) : super(CreateReportInitial()) {
    on<FetchCreateReport>((event, emit) async {
      emit(CreateReportLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => CreateReportFailed(
              event.body, event.headers, failure, event.extra),
          (success) => CreateReportSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
