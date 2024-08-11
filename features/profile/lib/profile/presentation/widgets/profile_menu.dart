import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String tittle;
  final GestureTapCallback onTap;

  const ProfileMenu({
    super.key,
    required this.icon,
    required this.tittle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MorphemeTapDetector(
      onTap: onTap,
      child: SizedBox(
        height: MorphemeSizes.s65,
        child: Padding(
          padding: const EdgeInsets.only(
            left: MorphemeSizes.s16,
            right: MorphemeSizes.s16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: context.color.grey,
                size: MorphemeSizes.s22,
              ),
              const MorphemeSpacing.horizontal12(),
              Expanded(
                child: MorphemeText.labelLarge(
                  tittle,
                  color: context.color.grey,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.color.grey,
                size: MorphemeSizes.s20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
