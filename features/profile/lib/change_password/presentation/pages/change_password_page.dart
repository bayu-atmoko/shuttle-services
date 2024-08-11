import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/change_password/presentation/bloc/change_password/change_password_bloc.dart';

import '../cubit/change_password_cubit.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>
    with MorphemeStatePage<ChangePasswordPage, ChangePasswordCubit> {
  @override
  ChangePasswordCubit setCubit() => locator<ChangePasswordCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final watchBlocState = context.watch<ChangePasswordBloc>().state;

    final oldPasswordKey =
        context.select((ChangePasswordCubit element) => element.oldPasswordKey);
    final newPasswordKey =
        context.select((ChangePasswordCubit element) => element.newPasswordKey);
    final confirmPasswordKey = context
        .select((ChangePasswordCubit element) => element.confirmPasswordKey);

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.changePassword,
      isExpanded: true,
      child: Padding(
        padding: const EdgeInsets.all(MorphemeSizes.s16),
        child: Column(
          children: [
            MorphemeTextField(
              key: oldPasswordKey,
              isPassword: true,
              title: context.s.oldPassword,
              decoration: InputDecoration(hintText: context.s.enterOldPassword),
              validator: ValidatorValueHelper.validatorPassword,
            ),
            const MorphemeSpacing.vertical16(),
            MorphemeTextField(
              key: newPasswordKey,
              isPassword: true,
              title: context.s.newPassword,
              decoration: InputDecoration(hintText: context.s.enterNewPassword),
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
                newPasswordKey.text,
              ),
            ),
            const Expanded(
              child: MorphemeSpacing.vertical16(),
            ),
            MorphemeButton.elevated(
              key: const ValueKey('buttonChangePassword'),
              isLoading: watchBlocState is ChangePasswordLoading,
              text: context.s.change,
              onPressed: () =>
                  context.read<ChangePasswordCubit>().onSaveButtonPressed(),
            ),
          ],
        ),
      ),
    );
  }
}
