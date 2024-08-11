import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/detail_report_body.dart';
import '../../../domain/entities/detail_report_entity.dart';
import '../../../domain/usecases/detail_report_use_case.dart';

part 'detail_report_event.dart';
part 'detail_report_state.dart';

class DetailReportBloc extends Bloc<DetailReportEvent, DetailReportState> {
  final DetailReportUseCase useCase;

  DetailReportBloc({
    required this.useCase,
  }) : super(DetailReportInitial()) {
    on<FetchDetailReport>((event, emit) async {
      emit(DetailReportLoading(event.body, event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) => DetailReportFailed(
              event.body, event.headers, failure, event.extra),
          (success) => DetailReportSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });
  }
}
