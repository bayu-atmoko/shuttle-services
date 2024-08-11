import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/change_password/data/models/body/change_password_body.dart';
import 'package:profile/change_password/presentation/bloc/change_password/change_password_bloc.dart';

import '../pages/change_password_page.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends MorphemeCubit<ChangePasswordStateCubit> {
  ChangePasswordCubit({
    required this.changePasswordBloc,
  }) : super(ChangePasswordStateCubit());

  final ChangePasswordBloc changePasswordBloc;

  final oldPasswordKey = GlobalKey<MorphemeTextFieldState>();
  final newPasswordKey = GlobalKey<MorphemeTextFieldState>();
  final confirmPasswordKey = GlobalKey<MorphemeTextFieldState>();

  @override
  void initArgument<Page>(BuildContext context, Page widget) {
    super.initArgument(context, widget);
    if (widget is! ChangePasswordPage) return;
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<ChangePasswordBloc>(
            create: (context) => changePasswordBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<ChangePasswordBloc, ChangePasswordState>(
            listener: _listenerChangePassword),
      ];

  @override
  void dispose() {
    changePasswordBloc.close();

    super.dispose();
  }

  void _fetchChangePassword(ChangePasswordBody body) {
    changePasswordBloc.add(FetchChangePassword(body));
  }

  bool _isFormValid() =>
      oldPasswordKey.isValid &&
      newPasswordKey.isValid &&
      confirmPasswordKey.isValid;

  void _setValidate() {
    oldPasswordKey.validate();
    newPasswordKey.validate();
    confirmPasswordKey.validate();
  }

  void onSaveButtonPressed() {
    _setValidate();
    if (_isFormValid()) {
      _fetchChangePassword(ChangePasswordBody(
        oldPassword: oldPasswordKey.text,
        newPassword: newPasswordKey.text,
      ));
    }
  }

  void _listenerChangePassword(
      BuildContext context, ChangePasswordState state) {
    state.when(
      onFailed: (state) {
        String message = state.failure.statusCode == 422
            ? context.s.errorOldPasswordMessage
            : context.s.errorChangePasswordMessage;

        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: message,
          ),
        );
      },
      onSuccess: (state) {
        context.showSnackBar(
          MorphemeSnackBar.success(
            key: const ValueKey('snackbarSuccess'),
            context: context,
            message: context.s.successChangePasswordMessage,
          ),
        );
        context.pop();
      },
    );
  }
}
