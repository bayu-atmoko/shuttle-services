import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/upload_file/data/models/body/upload_file_body.dart';
import 'package:main/upload_file/presentation/bloc/upload_file/upload_file_bloc.dart';
import 'package:profile/edit_profile/data/models/body/edit_profile_body.dart';
import 'package:profile/edit_profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends MorphemeCubit<EditProfileStateCubit> {
  EditProfileCubit({
    required this.editProfileBloc,
    required this.uploadFileBloc,
  }) : super(const EditProfileStateCubit());

  final EditProfileBloc editProfileBloc;
  final UploadFileBloc uploadFileBloc;

  final nameKey = GlobalKey<MorphemeTextFieldState>();
  final phoneKey = GlobalKey<MorphemeTextFieldState>();
  final addressKey = GlobalKey<MorphemeTextFieldState>();

  ExtraUser? profile;

  @override
  void initAfterFirstLayout(BuildContext context) {
    super.initAfterFirstLayout(context);

    _setInitialTextField();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<EditProfileBloc>(create: (context) => editProfileBloc),
        BlocProvider<UploadFileBloc>(create: (context) => uploadFileBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<EditProfileBloc, EditProfileState>(
            listener: _listenerEditProfile),
        BlocListener<UploadFileBloc, UploadFileState>(
            listener: _listenerUploadFile),
      ];

  @override
  void dispose() {
    editProfileBloc.close();
    uploadFileBloc.close();

    super.dispose();
  }

  void initialData(ExtraUser profile) {
    this.profile = profile;
  }

  void _setInitialTextField() {
    nameKey.text = profile?.name ?? '';
    phoneKey.text = profile?.phone ?? '';
    addressKey.text = profile?.address ?? '';

    emit(state.copyWith(
      gender: profile?.gender != null
          ? GenderEnumHelper.getEnumBasedOnValue(
              profile?.gender ?? '',
            )
          : null,
      vehicle: profile?.vehicle != null
          ? VehicleEnumHelper.getEnumBasedOnValue(
              profile?.vehicle ?? '',
            )
          : null,
    ));
  }

  void _fetchEditProfile(EditProfileBody body) {
    editProfileBloc.add(FetchEditProfile(body));
  }

  void _fetchUploadFile(File file) {
    uploadFileBloc.add(FetchUploadFile(
      UploadFileBody(
        files: {"image": file},
        type: MorphemeString.userUploadFile,
      ),
    ));
  }

  bool _isFormValid() =>
      nameKey.isValid &&
      phoneKey.isValid &&
      addressKey.isValid &&
      state.gender != null &&
      (profile?.role.orEmpty().toLowerCase() == UserRoleEnum.petugas.value
          ? state.vehicle != null
          : true);

  void _setValidate() {
    nameKey.validate();
    phoneKey.validate();
    addressKey.validate();

    emit(state.copyWith(
      isGenderValid: state.gender != null,
      isVehicleValid: state.vehicle != null,
    ));
  }

  void onGenderChanged(String value) {
    emit(state.copyWith(
      gender: GenderEnumHelper.getEnumBasedOnTitle(value),
    ));
  }

  void onVehicleChanged(String value) {
    emit(state.copyWith(
      vehicle: VehicleEnumHelper.getEnumBasedOnTitle(value),
    ));
  }

  void onSaveButtonPressed() {
    _setValidate();
    if (_isFormValid()) {
      if (state.photoFile != null &&
          state.photoFile?.path != null &&
          state.photoFile?.path != '') {
        _fetchUploadFile(File(state.photoFile?.path ?? ''));

        ///
      } else {
        _fetchEditProfile(EditProfileBody(
          name: nameKey.text,
          address: addressKey.text,
          gender: state.gender?.value,
          vehicle: state.vehicle?.value,
          phone: phoneKey.text,
          province: "-",
          regency: "-",
          district: "-",
          village: "-",
        ));
      }
    }
  }

  void _listenerEditProfile(BuildContext context, EditProfileState state) {
    state.when(
      onFailed: (state) {
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.errorEditProfileMessage,
          ),
        );
      },
      onSuccess: (state) {
        context.showSnackBar(
          MorphemeSnackBar.success(
            key: const ValueKey('snackbarSuccess'),
            context: context,
            message: context.s.successEditProfileMessage,
          ),
        );
        context.pop(true);
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
            message: context.s.errorEditProfileMessage,
          ),
        );
      },
      onSuccess: (state) {
        _fetchEditProfile(EditProfileBody(
          profilePicture: state.data.data?.imageUrl.orEmpty(),
          name: nameKey.text,
          address: addressKey.text,
          gender: this.state.gender?.value,
          vehicle: this.state.vehicle?.value,
          phone: phoneKey.text,
          province: "-",
          regency: "-",
          district: "-",
          village: "-",
        ));
      },
    );
  }

  void updatePhoto(XFile? image, BuildContext context) {
    if (image != null) {
      final sizeInBytes = File(image.path).lengthSync();

      if ((sizeInBytes / (1024 * 1024)) <= 10) {
        emit(state.copyWith(
          photoFile: image,
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
