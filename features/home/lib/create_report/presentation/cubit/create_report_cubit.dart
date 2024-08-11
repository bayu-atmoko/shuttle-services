import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/create_report/data/models/body/complaint_body.dart';
import 'package:home/create_report/data/models/body/create_report_body.dart';
import 'package:home/create_report/domain/entities/complaint_entity.dart';
import 'package:home/create_report/presentation/bloc/complaint/complaint_bloc.dart';
import 'package:home/create_report/presentation/bloc/create_report/create_report_bloc.dart';
import 'package:home/finish_report/data/models/body/edit_report_body.dart';
import 'package:home/finish_report/presentation/bloc/edit_report/edit_report_bloc.dart';
import 'package:main/upload_file/data/models/body/upload_file_body.dart';
import 'package:main/upload_file/presentation/bloc/upload_file/upload_file_bloc.dart';

part 'create_report_state.dart';

class CreateReportCubit extends MorphemeCubit<CreateReportStateCubit> {
  CreateReportCubit({
    required this.createReportBloc,
    required this.editReportBloc,
    required this.complaintBloc,
    required this.uploadFileBloc,
  }) : super(const CreateReportStateCubit());

  final CreateReportBloc createReportBloc;
  final EditReportBloc editReportBloc;
  final ComplaintBloc complaintBloc;
  final UploadFileBloc uploadFileBloc;

  final descriptionKey = GlobalKey<MorphemeTextFieldState>();
  final addressKey = GlobalKey<MorphemeTextFieldState>();
  final mapsKey = GlobalKey<MorphemeTextFieldState>();

  List<District> bandungDistrict = [];

  ExtraEditReport? editReportData;

  @override
  void initState(BuildContext context) {
    super.initState(context);

    getDistrictData();
    _fetchComplaint();
  }

  @override
  void initAfterFirstLayout(BuildContext context) {
    super.initAfterFirstLayout(context);

    _setInitialDataTextFiled();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<CreateReportBloc>(create: (context) => createReportBloc),
        BlocProvider<EditReportBloc>(create: (context) => editReportBloc),
        BlocProvider<ComplaintBloc>(create: (context) => complaintBloc),
        BlocProvider<UploadFileBloc>(create: (context) => uploadFileBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<CreateReportBloc, CreateReportState>(
            listener: _listenerCreateReport),
        BlocListener<EditReportBloc, EditReportState>(
            listener: _listenerEditReport),
        BlocListener<ComplaintBloc, ComplaintState>(
            listener: _listenerComplaint),
        BlocListener<UploadFileBloc, UploadFileState>(
            listener: _listenerUploadFile),
      ];

  @override
  void dispose() {
    createReportBloc.close();
    editReportBloc.close();
    complaintBloc.close();
    uploadFileBloc.close();

    super.dispose();
  }

  void initialData(ExtraEditReport? editReportData) {
    this.editReportData = editReportData;
  }

  void _setInitialDataTextFiled() {
    if (editReportData != null) {
      descriptionKey.text = editReportData?.description ?? '';
      addressKey.text = editReportData?.location?.address ?? '';

      emit(state.copyWith(
        photoUrl: editReportData?.media
            ?.map((e) => e.mediaPath.orEmpty())
            .skipWhile((value) => value.isNullOrEmpty)
            .toList(),
      ));

      onLocationMapsChanged(ExtraPlacePicker(
        locationName: editReportData?.location?.name,
        locationLatLng: editReportData?.location?.latitude != null &&
                editReportData?.location?.longitude != null
            ? LatLng(
                editReportData!.location!.latitude!,
                editReportData!.location!.longitude!,
              )
            : null,
      ));

      Future.delayed(const Duration(milliseconds: 500), () {
        onDistrictChanged(editReportData?.location?.district ?? '');
        onVillageChanged(editReportData?.location?.village ?? '');
      });
    }
  }

  void _setInitialDataComplaint(int? complainId) {
    final selectedComplaint = state.complaintList
            ?.where((element) =>
                element.complaintId != null &&
                element.complaintId == complainId)
            .toList() ??
        [];

    emit(state.copyWith(
      type: selectedComplaint.isNotEmpty ? selectedComplaint.first : null,
    ));
  }

  void getDistrictData() async {
    bandungDistrict = await RegionHelper.getBandungDistrictData();
    final districtDropdownList = bandungDistrict.map((e) => e.name).toList();

    emit(state.copyWith(
      districtDropdownList: districtDropdownList,
    ));
  }

  void onTypeChanged(String value) {
    final selectedComplaint = state.complaintList
            ?.where((element) =>
                element.title.isNotNullOrEmpty && element.title == value)
            .toList() ??
        [];
    emit(state.copyWith(
      type: selectedComplaint.isNotEmpty ? selectedComplaint.first : null,
    ));
  }

  void onDistrictChanged(String value) {
    final villageList = bandungDistrict
        .where((e) => e.name.trim().toLowerCase() == value.trim().toLowerCase())
        .toList();
    final List<String> villageDropdownList =
        villageList.isNotEmpty ? villageList.first.villages : [];

    emit(state.copyWith(
      district: villageList.isNotEmpty ? villageList.first.name : null,
      villageDropdownList: villageDropdownList,
    ));
  }

  void onVillageChanged(String value) {
    final villageList = state.villageDropdownList
        .where((e) => e.trim().toLowerCase() == value.trim().toLowerCase())
        .toList();

    emit(state.copyWith(
      village: villageList.isNotEmpty ? villageList.first : null,
    ));
  }

  void _fetchCreateReport(CreateReportBody body) {
    createReportBloc.add(FetchCreateReport(body));
  }

  void _fetchEditReport(EditReportBody body) {
    editReportBloc.add(FetchEditReport(body));
  }

  void _fetchComplaint() {
    complaintBloc.add(FetchComplaint(const ComplaintBody()));
  }

  void _fetchUploadFile(List<XFile> photoFile) {
    final List<File> fileList = photoFile
        .skipWhile((value) => value.path.isNullOrEmpty)
        .map((e) => File(e.path))
        .toList();
    final files = fileList.map((e) => {"image": e}).toList();

    uploadFileBloc.add(FetchMultipleUploadFile(
      MultipleUploadFileBody(
        files: files,
        type: MorphemeString.reportUploadFile,
      ),
    ));
  }

  bool _isFormValid() =>
      descriptionKey.isValid &&
      addressKey.isValid &&
      mapsKey.isValid &&
      state.isTypeValid == true &&
      state.isDistrictValid == true &&
      state.isVillageValid == true &&
      state.isPhotoValid == true;

  void _setValidate() {
    descriptionKey.validate();
    addressKey.validate();
    mapsKey.validate();

    emit(state.copyWith(
      isTypeValid: state.type != null,
      isDistrictValid: state.district != null,
      isVillageValid: state.village != null,
      isPhotoValid: (state.photoFile != null && state.photoFile!.isNotEmpty) ||
          (state.photoUrl != null && state.photoUrl!.isNotEmpty),
    ));
  }

  void onSaveButtonPressed(BuildContext context) {
    _setValidate();
    if (_isFormValid()) {
      if (editReportData != null) {
        _saveEditReport(context);
      } else {
        _saveCreateReport(context);
      }
    }
  }

  void _saveCreateReport(BuildContext context) {
    if (state.photoFile != null && state.photoFile!.isNotEmpty) {
      _fetchUploadFile(state.photoFile ?? []);

      ///
    } else {
      context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.errorCreateReportMessage,
        ),
      );
    }
  }

  void _saveEditReport(BuildContext context) {
    if (state.photoFile != null && state.photoFile!.isNotEmpty) {
      _fetchUploadFile(state.photoFile ?? []);

      ///
    } else if (state.photoUrl != null && state.photoUrl!.isNotEmpty) {
      _fetchEditReport(
        EditReportBody(
          reportId: editReportData!.reportId.toString(),
          description: descriptionKey.text,
          address: addressKey.text,
          district: state.district,
          village: state.village,
          complaintId: state.type?.complaintId,
          latitude: state.latitude,
          longitude: state.longitude,
          locationName: state.locationName,
          garbagePhoto: state.photoUrl,
        ),
      );

      ///
    } else {
      context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.errorEditReportMessage,
        ),
      );
    }
  }

  void _listenerCreateReport(BuildContext context, CreateReportState state) {
    state.when(
      onFailed: (state) {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.errorCreateReportMessage,
          ),
        );
      },
      onSuccess: (state) {
        context.showSnackBar(
          MorphemeSnackBar.success(
            key: const ValueKey('snackbarSuccess'),
            context: context,
            message: context.s.successCreateReportMessage,
          ),
        );
        context.pop(true);
      },
    );
  }

  void _listenerEditReport(BuildContext context, EditReportState state) {
    state.when(
      onFailed: (state) {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.errorEditReportMessage,
          ),
        );
      },
      onSuccess: (state) {
        context.showSnackBar(
          MorphemeSnackBar.success(
            key: const ValueKey('snackbarSuccess'),
            context: context,
            message: context.s.successEditReportMessage,
          ),
        );
        context.pop(true);
      },
    );
  }

  void _listenerComplaint(BuildContext context, ComplaintState state) {
    state.when(
      onFailed: (state) {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.thereAreTechError,
          ),
        );
      },
      onSuccess: (state) {
        emit(this.state.copyWith(
              complaintList: state.data.data,
            ));
        _setInitialDataComplaint(editReportData?.complaintId);
      },
    );
  }

  void _listenerUploadFile(BuildContext context, UploadFileState state) {
    state.when(
      onFailed: (state) {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: editReportData != null
                ? context.s.errorEditReportMessage
                : context.s.errorCreateReportMessage,
          ),
        );
      },
      onSuccessMultiple: (state) {
        /// edit the report
        if (editReportData != null) {
          if (editReportData?.reportId != null && state.data.isNotEmpty) {
            List<String> garbagePhoto = state.data.isNotEmpty ? state.data : [];
            garbagePhoto.addAll(this.state.photoUrl ?? []);

            _fetchEditReport(
              EditReportBody(
                reportId: editReportData!.reportId.toString(),
                description: descriptionKey.text,
                address: addressKey.text,
                district: this.state.district,
                village: this.state.village,
                complaintId: this.state.type?.complaintId,
                latitude: this.state.latitude,
                longitude: this.state.longitude,
                locationName: this.state.locationName,
                garbagePhoto: garbagePhoto.isNotEmpty ? garbagePhoto : null,
              ),
            );
          } else {
            context.showSnackBar(
              MorphemeSnackBar.error(
                key: const ValueKey('snackbarError'),
                context: context,
                message: context.s.errorEditReportMessage,
              ),
            );
          }

          /// create new report
        } else {
          _fetchCreateReport(
            CreateReportBody(
              description: descriptionKey.text,
              address: addressKey.text,
              district: this.state.district,
              village: this.state.village,
              complaintId: this.state.type?.complaintId,
              latitude: this.state.latitude,
              longitude: this.state.longitude,
              locationName: this.state.locationName,
              garbagePhoto: state.data.isNotEmpty ? state.data : null,
            ),
          );
        }
      },
    );
  }

  void deletePhotoUrl(int index) {
    final List<String> photoUrl = List.of(state.photoUrl ?? []);
    photoUrl.removeAt(index);
    emit(state.copyWith(
      photoUrl: photoUrl,
    ));
  }

  void deletePhotoFile(int index) {
    final List<XFile> photoFile = List.of(state.photoFile ?? []);
    photoFile.removeAt(index);
    emit(state.copyWith(
      photoFile: photoFile,
    ));
  }

  void updatePhotoFile(XFile? image, BuildContext context) {
    if (image != null) {
      final sizeInBytes = File(image.path).lengthSync();

      if ((sizeInBytes / (1024 * 1024)) <= 10) {
        final List<XFile> photoFile = List.of(state.photoFile ?? []);
        photoFile.add(image);
        emit(state.copyWith(
          photoFile: photoFile,
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

  void onLocationMapsChanged(ExtraPlacePicker value) {
    final latLng = (value.locationLatLng != null
            ? ('${value.locationLatLng?.latitude ?? ''} & ${value.locationLatLng?.longitude ?? ''}')
            : '')
        .trim();
    mapsKey.text =
        latLng.isNotNullOrEmpty ? latLng : value.locationName.orEmpty();

    emit(state.copyWith(
      latitude: value.locationLatLng?.latitude,
      longitude: value.locationLatLng?.longitude,
      locationName: value.locationLatLng?.latitude != null
          ? value.locationName.isNotNullOrEmpty
              ? value.locationName!
              : '-'
          : value.locationName,
    ));
  }
}
