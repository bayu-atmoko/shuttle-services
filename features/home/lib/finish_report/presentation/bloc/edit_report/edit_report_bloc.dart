import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/edit_report_body.dart';
import '../../../domain/entities/edit_report_entity.dart';
import '../../../domain/usecases/edit_report_use_case.dart';

part 'edit_report_event.dart';
part 'edit_report_state.dart';

class EditReportBloc extends Bloc<EditReportEvent, EditReportState> {
  final EditReportUseCase useCase;

  EditReportBloc({
    required this.useCase,
  }) : super(EditReportInitial()) {
    on<FetchEditReport>((event, emit) async {
      emit(EditReportLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              EditReportFailed(event.body, event.headers, failure, event.extra),
          (success) => EditReportSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
