import 'package:auth/login/presentation/cubit/login_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RememberAndForgotPinSection extends StatelessWidget {
  const RememberAndForgotPinSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isRememberMe =
        context.select((LoginCubit element) => element.state.isRememberMe);

    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(
          left: MorphemeSizes.s1,
          right: MorphemeSizes.s16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  key: const ValueKey(MorphemeDataTesId.rememberMe),
                  value: isRememberMe,
                  onChanged: context.read<LoginCubit>().onRememberMeChanged,
                ),
                Text(
                  context.s.rememberMe,
                  style: context.bodySmall?.copyWith(
                    fontSize: 14,
                    color: context.color.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // MorphemeButton.text(
            //   key: const ValueKey(MorphemeDataTesId.buttonForgotPassword),
            //   isExpand: false,
            //   style: TextButton.styleFrom(
            //     padding: EdgeInsets.zero,
            //   ),
            //   text: '${context.s.forgotPassword}?',
            //   onPressed: () =>
            //       context.read<LoginCubit>().onForgotPasswordPressed(context),
            // ),
          ],
        ),
      ),
    );
  }
}
