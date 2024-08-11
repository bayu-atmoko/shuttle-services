import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MapsButton extends StatelessWidget {
  const MapsButton({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MorphemeTapDetector(
      onTap: onTap,
      child: Container(
        height: MorphemeSizes.s36,
        decoration: BoxDecoration(
          color: context.color.primary200,
          borderRadius: BorderRadius.circular(
            MorphemeSizes.s6,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: MorphemeSizes.s12,
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MorphemeText.titleSmall(
                context.s.viewLocationInMaps,
                fontWeight: FontWeight.w600,
                color: context.color.primaryDark,
              ),
              const MorphemeSpacing.horizontal6(),
              Icon(
                Icons.pin_drop_outlined,
                size: MorphemeSizes.s20,
                color: context.color.primaryDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
