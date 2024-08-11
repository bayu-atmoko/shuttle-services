import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CleanButton extends StatelessWidget {
  final String title;
  final String cancelTitle;
  final GestureTapCallback onPressed;
  final GestureTapCallback onCancelPressed;

  const CleanButton({
    super.key,
    required this.title,
    required this.cancelTitle,
    required this.onPressed,
    required this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: MorphemeSizes.s10,
      margin: EdgeInsets.zero,
      child: Container(
        color: context.color.white,
        height: MorphemeSizes.s80,
        padding: const EdgeInsets.symmetric(
          horizontal: MorphemeSizes.marginPage,
          vertical: MorphemeSizes.s20,
        ),
        child: Row(
          children: [
            Expanded(
              child: MorphemeButton.elevated(
                key: const ValueKey('buttonCancelReport'),
                text: cancelTitle,
                onPressed: onCancelPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.color.error700,
                ),
              ),
            ),
            const MorphemeSpacing.horizontal8(),
            Expanded(
              child: MorphemeButton.elevated(
                key: const ValueKey('buttonDetailReport'),
                text: title,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
