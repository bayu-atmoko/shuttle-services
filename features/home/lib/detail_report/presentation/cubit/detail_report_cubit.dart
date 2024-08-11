import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/detail_report/data/models/body/delete_report_body.dart';
import 'package:home/detail_report/data/models/body/detail_report_body.dart';
import 'package:home/detail_report/domain/entities/detail_report_entity.dart';
import 'package:home/detail_report/presentation/bloc/delete_report/delete_report_bloc.dart';
import 'package:home/detail_report/presentation/bloc/detail_report/detail_report_bloc.dart';
import 'package:home/finish_report/data/models/body/edit_report_body.dart';
import 'package:home/finish_report/presentation/bloc/edit_report/edit_report_bloc.dart';
import 'package:main/upload_file/data/models/body/upload_file_body.dart';
import 'package:main/upload_file/presentation/bloc/upload_file/upload_file_bloc.dart';

part 'detail_report_state.dart';

class DetailReportCubit extends MorphemeCubit<DetailReportStateCubit> {
  DetailReportCubit({
    required this.detailReportBloc,
    required this.deleteReportBloc,
    required this.editReportBloc,
    required this.uploadFileBloc,
  }) : super(const DetailReportStateCubit());

  final DetailReportBloc detailReportBloc;
  final DeleteReportBloc deleteReportBloc;
  final EditReportBloc editReportBloc;
  final UploadFileBloc uploadFileBloc;

  String? reportId;

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState(BuildContext context) {
    super.initState(context);
    _getUserRole();
  }

  @override
  void initAfterFirstLayout(BuildContext context) {
    super.initAfterFirstLayout(context);
    fetchDetailReport();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<DetailReportBloc>(create: (context) => detailReportBloc),
        BlocProvider<DeleteReportBloc>(create: (context) => deleteReportBloc),
        BlocProvider<EditReportBloc>(create: (context) => editReportBloc),
        BlocProvider<UploadFileBloc>(create: (context) => uploadFileBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<DetailReportBloc, DetailReportState>(
            listener: _listenerDetailReport),
        BlocListener<DeleteReportBloc, DeleteReportState>(
            listener: _listenerDeleteReport),
        BlocListener<EditReportBloc, EditReportState>(
            listener: _listenerEditReport),
        BlocListener<UploadFileBloc, UploadFileState>(
            listener: _listenerUploadFile),
      ];

  @override
  void dispose() {
    detailReportBloc.close();
    deleteReportBloc.close();
    editReportBloc.close();
    uploadFileBloc.close();

    super.dispose();
  }

  void initialData(String reportId) {
    this.reportId = reportId;
  }

  void _getUserRole() async {
    final role = await FlutterSecureStorageHelper.getRole();
    emit(state.copyWith(
      userRole: role,
    ));
  }

  void fetchDetailReport() {
    detailReportBloc.add(FetchDetailReport(DetailReportBody(
      reportId: reportId.orEmpty(),
    )));
  }

  void fetchDeleteReport() {
    deleteReportBloc.add(FetchDeleteReport(DeleteReportBody(
      reportId: reportId.orEmpty(),
    )));
  }

  void _fetchEditReport(EditReportBody body) {
    editReportBloc.add(FetchEditReport(body));
  }

  void onCleanButtonClicked() => _fetchEditReport(EditReportBody(
        reportId: reportId.orEmpty(),
        status: ReportStatusEnum.cleaned.value,
      ));

  void onCancelButtonClicked(String reason) => _fetchEditReport(EditReportBody(
        reportId: reportId.orEmpty(),
        status: ReportStatusEnum.cancel.value,
        cancellationReason: reason,
      ));

  void _fetchUploadFile(List<XFile> photoFile) {
    final List<File> fileList = photoFile
        .skipWhile((value) => value.path.isNullOrEmpty)
        .map((e) => File(e.path))
        .toList();
    final files = fileList.map((e) => {"image": e}).toList();

    uploadFileBloc.add(FetchMultipleUploadFile(
      MultipleUploadFileBody(
        files: files,
        type: MorphemeString.reportCleanUploadFile,
      ),
    ));
  }

  bool _isFormValid() => state.isPhotoValid == true;

  void _setValidate() {
    emit(state.copyWith(
      isPhotoValid: state.garbagePhotoCleanedFile != null &&
          state.garbagePhotoCleanedFile!.isNotEmpty,
    ));
  }

  void onFinishButtonPressed(BuildContext context) {
    _setValidate();
    if (_isFormValid()) {
      if (state.garbagePhotoCleanedFile != null &&
          state.garbagePhotoCleanedFile!.isNotEmpty) {
        _fetchUploadFile(state.garbagePhotoCleanedFile ?? []);

        ///
      } else {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.errorFinishReportMessage,
          ),
        );
      }
    }
  }

  void _listenerUploadFile(BuildContext context, UploadFileState state) {
    state.when(
      onFailed: (state) {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.errorFinishReportMessage,
          ),
        );
      },
      onSuccessMultiple: (state) {
        if (state.data.isNotEmpty) {
          _fetchEditReport(
            EditReportBody(
              reportId: reportId.orEmpty(),
              status: ReportStatusEnum.finish.value,
              garbagePhotoCleaned: state.data.isNotEmpty ? state.data : null,
            ),
          );
        } else {
          context.showSnackBar(
            MorphemeSnackBar.error(
              key: const ValueKey('snackbarError'),
              context: context,
              message: context.s.errorFinishReportMessage,
            ),
          );
        }
      },
    );
  }

  void _listenerDetailReport(BuildContext context, DetailReportState state) {
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
              report: state.data.data,
            ));
      },
    );
  }

  void _listenerDeleteReport(BuildContext context, DeleteReportState state) {
    state.when(
      onLoading: (state) =>
          MorphemeCircularLoadingDialog.showLoadingDialog(context, _keyLoader),
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();

        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.errorDeleteReportMessage,
          ),
        );
      },
      onSuccess: (state) {
        Navigator.of(context, rootNavigator: true).pop();

        context.showSnackBar(
          MorphemeSnackBar.success(
            key: const ValueKey('snackbarSuccess'),
            context: context,
            message: context.s.successDeleteReportMessage,
          ),
        );

        context.pop(true);
      },
    );
  }

  void _listenerEditReport(BuildContext context, EditReportState state) {
    state.when(
      onLoading: (state) =>
          MorphemeCircularLoadingDialog.showLoadingDialog(context, _keyLoader),
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();

        final status = state.body.status?.toLowerCase();
        final isOfficer = this.state.userRole.orEmpty().toLowerCase() ==
            UserRoleEnum.petugas.value;

        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: status == ReportStatusEnum.finish.value
                ? context.s.errorFinishReportMessage
                : status == ReportStatusEnum.cleaned.value
                    ? context.s.errorStartedCleanGarbage
                    : status == ReportStatusEnum.cancel.value
                        ? isOfficer
                            ? context.s.errorRejectReportMessage
                            : context.s.errorCancelReportMessage
                        : context.s.errorEditReportMessage,
          ),
        );
      },
      onSuccess: (state) {
        Navigator.of(context, rootNavigator: true).pop();

        final status = state.data.data?.report?.status?.toLowerCase();
        final isOfficer = this.state.userRole.orEmpty().toLowerCase() ==
            UserRoleEnum.petugas.value;

        context.showSnackBar(
          MorphemeSnackBar.success(
            key: const ValueKey('snackbarSuccess'),
            context: context,
            message: status == ReportStatusEnum.finish.value
                ? context.s.successFinishReportMessage
                : status == ReportStatusEnum.cleaned.value
                    ? context.s.successStartedCleanGarbage
                    : status == ReportStatusEnum.cancel.value
                        ? isOfficer
                            ? context.s.successRejectReportMessage
                            : context.s.successCancelReportMessage
                        : context.s.successEditReportMessage,
          ),
        );

        context.pop(true);
      },
    );
  }

  void deletePhoto(int index) {
    final List<XFile> photoFile = List.of(state.garbagePhotoCleanedFile ?? []);
    photoFile.removeAt(index);
    emit(state.copyWith(
      garbagePhotoCleanedFile: photoFile,
    ));
  }

  void updatePhoto(XFile? image, BuildContext context) {
    if (image != null) {
      final sizeInBytes = File(image.path).lengthSync();

      if ((sizeInBytes / (1024 * 1024)) <= 10) {
        final List<XFile> photoFile =
            List.of(state.garbagePhotoCleanedFile ?? []);
        photoFile.add(image);
        emit(state.copyWith(
          garbagePhotoCleanedFile: photoFile,
        ));

        ///
      } else {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.maximumUploadSize10MB,
          ),
        );
      }
    }
  }
}
