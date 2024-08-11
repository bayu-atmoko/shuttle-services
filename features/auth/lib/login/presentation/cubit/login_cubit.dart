import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../data/models/body/login_body.dart';
import '../bloc/login/login_bloc.dart';

part 'login_state.dart';

class LoginCubit extends MorphemeCubit<LoginStateCubit> {
  LoginCubit({
    required this.loginBloc,
  }) : super(const LoginStateCubit());

  final LoginBloc loginBloc;

  final emailKey = GlobalKey<MorphemeTextFieldState>();
  final passwordKey = GlobalKey<MorphemeTextFieldState>();

  @override
  void initState(BuildContext context) {
    super.initState(context);

    /// clear value in ExpiredTokenRepository
    locator<ExpiredTokenRepository>().clearValue();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<LoginBloc>(create: (context) => loginBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<LoginBloc, LoginState>(listener: _listenerLogin),
      ];

  @override
  void dispose() {
    loginBloc.close();
  }

  @override
  void initAfterFirstLayout(BuildContext context) async {
    super.initAfterFirstLayout(context);

    bool isRememberMe = await FlutterSecureStorageHelper.isRememberMe();
    if (isRememberMe) {
      String? email = await FlutterSecureStorageHelper.getEmail();
      String? password = await FlutterSecureStorageHelper.getPassword();
      emailKey.text = email.orEmpty();
      passwordKey.text = password.orEmpty();

      emit(state.copyWith(
        isRememberMe: true,
      ));
    }
  }

  void onForgotPasswordPressed(BuildContext context) {
    context.goToForgotPassword();
  }

  bool _isValidEmailPassword() => emailKey.isValid && passwordKey.isValid;
  void _setValidate() {
    emailKey.validate();
    passwordKey.validate();
  }

  void onLoginWithEmailPressed(BuildContext context) {
    _setValidate();
    if (_isValidEmailPassword()) {
      _fetchLogin(LoginBody(email: emailKey.text, password: passwordKey.text));
    }
  }

  void onRegisterPressed(BuildContext context) => context.goToRegister();

  void _fetchLogin(LoginBody body) {
    loginBloc.add(FetchLogin(body));
  }

  void _listenerLogin(BuildContext context, LoginState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.errorLoginMessage,
        ),
      ),
      onSuccess: (state) {
        _setRememberMe();
        context.goToHome(state.data.data?.profile?.role ?? '');
      },
    );
  }

  void onRememberMeChanged(bool? value) async {
    if (value != null) {
      await FlutterSecureStorageHelper.saveRememberMe(value);
    }
    emit(state.copyWith(
      isRememberMe: value ?? !state.isRememberMe,
    ));
  }

  void _setRememberMe() async {
    if (state.isRememberMe) {
      await FlutterSecureStorageHelper.saveEmail(emailKey.text);
      await FlutterSecureStorageHelper.savePassword(passwordKey.text);
    } else {
      await FlutterSecureStorageHelper.removeEmail();
      await FlutterSecureStorageHelper.removePassword();
    }
  }
}
