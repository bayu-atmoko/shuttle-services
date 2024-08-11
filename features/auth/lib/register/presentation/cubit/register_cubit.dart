import 'package:auth/register/data/models/body/register_body.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../bloc/register/register_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends MorphemeCubit<RegisterStateCubit> {
  RegisterCubit({required this.registerBloc})
      : super(const RegisterStateCubit());

  final RegisterBloc registerBloc;

  final phoneKey = GlobalKey<MorphemeTextFieldState>();
  final nameKey = GlobalKey<MorphemeTextFieldState>();
  final emailKey = GlobalKey<MorphemeTextFieldState>();
  final passwordKey = GlobalKey<MorphemeTextFieldState>();
  final confirmPasswordKey = GlobalKey<MorphemeTextFieldState>();

  @override
  void initState(BuildContext context) {
    super.initState(context);

    /// clear value in ExpiredTokenRepository
    locator<ExpiredTokenRepository>().clearValue();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<RegisterBloc>(create: (context) => registerBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<RegisterBloc, RegisterState>(listener: _listenerRegister),
      ];

  @override
  void dispose() {
    registerBloc.close();
  }

  bool _isFormValid() =>
      emailKey.isValid &&
      passwordKey.isValid &&
      nameKey.isValid &&
      phoneKey.isValid &&
      confirmPasswordKey.isValid;

  void _setValidate() {
    emailKey.validate();
    passwordKey.validate();
    nameKey.validate();
    phoneKey.validate();
    confirmPasswordKey.validate();
  }

  void onSignUpWithEmailPressed(BuildContext context) {
    _setValidate();
    if (_isFormValid()) {
      registerBloc.add(
        FetchRegister(
          RegisterBody(
            email: emailKey.text,
            password: passwordKey.text,
            name: nameKey.text,
            phone: phoneKey.text,
          ),
        ),
      );
    }
  }

  void _listenerRegister(BuildContext context, RegisterState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.errorRegisterMessage,
        ),
      ),
      onSuccess: (state) => context.goToHome(state.data.data?.data?.role ?? ''),
    );
  }
}
