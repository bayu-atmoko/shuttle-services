import 'package:auth/login/presentation/cubit/login_cubit.dart';
import 'package:auth/login/presentation/widgets/remember_and_forgot_pin_section.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/login/login_bloc.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final watchLoginState = context.watch<LoginBloc>().state;

    final emailKey = context.select((LoginCubit element) => element.emailKey);
    final passwordKey =
        context.select((LoginCubit element) => element.passwordKey);

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: MorphemeSizes.marginPage),
          child: MorphemeTextField(
            key: emailKey,
            textfieldKey: const ValueKey(MorphemeDataTesId.inputEmail),
            title: context.s.email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: context.s.yourEmail),
            validator: ValidatorValueHelper.validatorEmail,
            textInputAction: TextInputAction.next,
          ),
        ),
        const MorphemeSpacing.vertical16(),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: MorphemeSizes.marginPage),
          child: MorphemeTextField(
            key: passwordKey,
            textfieldKey: const ValueKey(MorphemeDataTesId.inputPassword),
            isPassword: true,
            title: context.s.password,
            decoration: InputDecoration(hintText: context.s.fillInPassword),
            validator: ValidatorValueHelper.validatorPassword,
          ),
        ),
        const RememberAndForgotPinSection(),
        const MorphemeSpacing.vertical16(),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: MorphemeSizes.marginPage),
          child: MorphemeButton.elevated(
            key: const ValueKey(MorphemeDataTesId.buttonLoginWithEmail),
            isLoading: watchLoginState is LoginLoading,
            text: context.s.login,
            onPressed: () =>
                context.read<LoginCubit>().onLoginWithEmailPressed(context),
          ),
        ),
      ],
    );
  }
}
