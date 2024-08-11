import 'package:auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with MorphemeStatePage<RegisterPage, RegisterCubit> {
  @override
  RegisterCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    final watchRegisterState = context.watch<RegisterBloc>().state;

    final emailKey =
        context.select((RegisterCubit element) => element.emailKey);
    final nameKey = context.select((RegisterCubit element) => element.nameKey);
    final phoneKey =
        context.select((RegisterCubit element) => element.phoneKey);
    final passwordKey =
        context.select((RegisterCubit element) => element.passwordKey);
    final confirmPasswordKey =
        context.select((RegisterCubit element) => element.confirmPasswordKey);

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.register,
      isExpanded: true,
      child: Padding(
        padding: const EdgeInsets.all(MorphemeSizes.s16),
        child: Column(
          children: [
            MorphemeTextField(
              key: nameKey,
              title: context.s.name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: context.s.fillInName),
              validator: ValidatorValueHelper.validatorEmpty,
              textInputAction: TextInputAction.next,
            ),
            const MorphemeSpacing.vertical16(),
            MorphemeTextField(
              key: emailKey,
              title: context.s.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: context.s.yourEmail),
              validator: ValidatorValueHelper.validatorEmail,
              textInputAction: TextInputAction.next,
            ),
            const MorphemeSpacing.vertical16(),
            MorphemeTextField(
              key: phoneKey,
              title: context.s.phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: context.s.fillInPhone),
              validator: ValidatorValueHelper.validatorPhone,
              textInputAction: TextInputAction.next,
            ),
            const MorphemeSpacing.vertical16(),
            MorphemeTextField(
              key: passwordKey,
              isPassword: true,
              title: context.s.password,
              decoration: InputDecoration(hintText: context.s.fillInPassword),
              validator: ValidatorValueHelper.validatorPassword,
            ),
            const MorphemeSpacing.vertical16(),
            MorphemeTextField(
              key: confirmPasswordKey,
              isPassword: true,
              title: context.s.passwordConfirmation,
              decoration: InputDecoration(
                  hintText: context.s.fillInPasswordConfirmation),
              validator: (context, value) =>
                  ValidatorValueHelper.validatorConfirmPassword(
                context,
                value,
                passwordKey.text,
              ),
            ),
            const Expanded(
              child: MorphemeSpacing.vertical16(),
            ),
            MorphemeButton.elevated(
              key: const ValueKey('buttonRegister'),
              isLoading: watchRegisterState is RegisterLoading,
              text: context.s.register,
              onPressed: () => context
                  .read<RegisterCubit>()
                  .onSignUpWithEmailPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
