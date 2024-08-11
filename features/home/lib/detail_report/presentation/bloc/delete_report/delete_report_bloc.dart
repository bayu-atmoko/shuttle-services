import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/delete_report_body.dart';
import '../../../domain/entities/delete_report_entity.dart';
import '../../../domain/usecases/delete_report_use_case.dart';

part 'delete_report_event.dart';
part 'delete_report_state.dart';

class DeleteReportBloc extends Bloc<DeleteReportEvent, DeleteReportState> {
  final DeleteReportUseCase useCase;

  DeleteReportBloc({
    required this.useCase,
  }) : super(DeleteReportInitial()) {
    on<FetchDeleteReport>((event, emit) async {
      emit(DeleteReportLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => DeleteReportFailed(
              event.body, event.headers, failure, event.extra),
          (success) => DeleteReportSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
