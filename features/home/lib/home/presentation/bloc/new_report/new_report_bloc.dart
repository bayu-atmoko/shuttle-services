import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/list_report_body.dart';
import '../../../domain/entities/list_report_entity.dart';
import '../../../domain/usecases/list_report_use_case.dart';

part 'new_report_event.dart';
part 'new_report_state.dart';

class NewReportBloc extends Bloc<NewReportEvent, NewReportState> {
  final ListReportUseCase useCase;

  NewReportBloc({
    required this.useCase,
  }) : super(NewReportInitial()) {
    on<FetchNewReport>((event, emit) async {
      emit(NewReportLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              NewReportFailed(event.body, event.headers, failure, event.extra),
          (success) =>
              NewReportSuccess(event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
