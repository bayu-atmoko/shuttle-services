import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home/data/models/body/list_report_body.dart';
import 'package:home/home/domain/entities/list_report_entity.dart';
import 'package:home/home/presentation/bloc/assigned_report/assigned_report_bloc.dart';
import 'package:home/home/presentation/bloc/cancel_report/cancel_report_bloc.dart';
import 'package:home/home/presentation/bloc/cleaned_report/cleaned_report_bloc.dart';
import 'package:home/home/presentation/bloc/finish_report/finish_report_bloc.dart';
import 'package:home/home/presentation/bloc/new_report/new_report_bloc.dart';

part 'home_state.dart';

class HomeCubit extends MorphemeCubit<HomeStateCubit> {
  HomeCubit({
    required this.newReportBloc,
    required this.assignedReportBloc,
    required this.cleanedReportBloc,
    required this.finishReportBloc,
    required this.cancelReportBloc,
  }) : super(const HomeStateCubit());

  final NewReportBloc newReportBloc;
  final AssignedReportBloc assignedReportBloc;
  final CleanedReportBloc cleanedReportBloc;
  final FinishReportBloc finishReportBloc;
  final CancelReportBloc cancelReportBloc;

  String? userRole;

  @override
  void initState(BuildContext context) async {
    getReportList();
  }

  void getReportList() {
    fetchNewReport(ListReportBody(
      status: ReportStatusEnum.newReport.value,
    ));
    fetchAssignedReport(ListReportBody(
      status: ReportStatusEnum.assigned.value,
    ));
    fetchCleanedReport(ListReportBody(
      status: ReportStatusEnum.cleaned.value,
    ));
    fetchFinishReport(ListReportBody(
      status: ReportStatusEnum.finish.value,
    ));
    fetchCancelReport(ListReportBody(
      status: ReportStatusEnum.cancel.value,
    ));
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<NewReportBloc>(create: (context) => newReportBloc),
        BlocProvider<AssignedReportBloc>(
            create: (context) => assignedReportBloc),
        BlocProvider<CleanedReportBloc>(create: (context) => cleanedReportBloc),
        BlocProvider<FinishReportBloc>(create: (context) => finishReportBloc),
        BlocProvider<CancelReportBloc>(create: (context) => cancelReportBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<NewReportBloc, NewReportState>(
            listener: _listenerListReportNew),
        BlocListener<AssignedReportBloc, AssignedReportState>(
            listener: _listenerListReportAssigned),
        BlocListener<CleanedReportBloc, CleanedReportState>(
            listener: _listenerListReportCleaned),
        BlocListener<FinishReportBloc, FinishReportState>(
            listener: _listenerListReportFinish),
        BlocListener<CancelReportBloc, CancelReportState>(
            listener: _listenerListReportCancel),
      ];

  @override
  void dispose() {
    newReportBloc.close();
    assignedReportBloc.close();
    cleanedReportBloc.close();
    finishReportBloc.close();
    cancelReportBloc.close();
  }

  void initialData(String userRole) {
    this.userRole = userRole;
  }

  void onAddPressed(BuildContext context) async {
    final isRefresh = await context.goToCreateReport();
    if (isRefresh == true) {
      getReportList();
    }
  }

  void onPageChanged(int page) {
    if (userRole.orEmpty().toLowerCase() == UserRoleEnum.petugas.value) {
      _onPageChangedOfficer(page);
    } else {
      _onPageChangedPeople(page);
    }
  }

  void _onPageChangedPeople(int page) {
    switch (page) {
      case 0:
        fetchNewReport(ListReportBody(
          status: ReportStatusEnum.newReport.value,
        ));
        break;
      case 1:
        fetchAssignedReport(ListReportBody(
          status: ReportStatusEnum.assigned.value,
        ));
        break;
      case 2:
        fetchCleanedReport(ListReportBody(
          status: ReportStatusEnum.cleaned.value,
        ));
        break;
      case 3:
        fetchFinishReport(ListReportBody(
          status: ReportStatusEnum.finish.value,
        ));
        break;
      case 4:
        fetchCancelReport(ListReportBody(
          status: ReportStatusEnum.cancel.value,
        ));
        break;
    }
  }

  void _onPageChangedOfficer(int page) {
    switch (page) {
      case 0:
        fetchAssignedReport(ListReportBody(
          status: ReportStatusEnum.assigned.value,
        ));
        break;
      case 1:
        fetchCleanedReport(ListReportBody(
          status: ReportStatusEnum.cleaned.value,
        ));
        break;
      case 2:
        fetchFinishReport(ListReportBody(
          status: ReportStatusEnum.finish.value,
        ));
        break;
      case 3:
        fetchCancelReport(ListReportBody(
          status: ReportStatusEnum.cancel.value,
        ));
        break;
    }
  }

  void fetchNewReport(ListReportBody body) {
    newReportBloc.add(FetchNewReport(body));
  }

  void _listenerListReportNew(BuildContext context, NewReportState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportNew: state.data.data?.data,
            ));
      },
    );
  }

  void fetchAssignedReport(ListReportBody body) {
    assignedReportBloc.add(FetchAssignedReport(body));
  }

  void _listenerListReportAssigned(
      BuildContext context, AssignedReportState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportAssigned: state.data.data?.data,
            ));
      },
    );
  }

  void fetchCleanedReport(ListReportBody body) {
    cleanedReportBloc.add(FetchCleanedReport(body));
  }

  void _listenerListReportCleaned(
      BuildContext context, CleanedReportState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportCleaned: state.data.data?.data,
            ));
      },
    );
  }

  void fetchFinishReport(ListReportBody body) {
    finishReportBloc.add(FetchFinishReport(body));
  }

  void _listenerListReportFinish(
      BuildContext context, FinishReportState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportFinish: state.data.data?.data,
            ));
      },
    );
  }

  void fetchCancelReport(ListReportBody body) {
    cancelReportBloc.add(FetchCancelReport(body));
  }

  void _listenerListReportCancel(
      BuildContext context, CancelReportState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportCancel: state.data.data?.data,
            ));
      },
    );
  }
}
