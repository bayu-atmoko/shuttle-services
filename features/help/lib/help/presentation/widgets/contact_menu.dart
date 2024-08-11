import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ContactMenu extends StatelessWidget {
  final String icon;
  final Widget? customIcon;
  final String tittle;
  final String contactInfo;
  final GestureTapCallback onTap;

  const ContactMenu({
    super.key,
    required this.icon,
    this.customIcon,
    required this.tittle,
    required this.contactInfo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MorphemeTapDetector(
      onTap: onTap,
      child: Container(
        height: MorphemeSizes.s50,
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(
            MorphemeSizes.s6,
          ),
          border: Border.all(
            color: context.color.grey,
          ),
        ),
        padding: const EdgeInsets.only(
          right: MorphemeSizes.s10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MorphemeSizes.s50,
              height: MorphemeSizes.s50,
              decoration: BoxDecoration(
                color: context.color.primary100,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(MorphemeSizes.s6),
                ),
              ),
              padding: customIcon != null
                  ? null
                  : const EdgeInsets.all(
                      MorphemeSizes.s14,
                    ),
              child: customIcon ??
                  MorphemeImageAsset(
                    icon,
                    fit: BoxFit.contain,
                    width: MorphemeSizes.s22,
                    height: MorphemeSizes.s22,
                  ),
            ),
            const MorphemeSpacing.horizontal10(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MorphemeText.labelMedium(
                    tittle,
                    color: context.color.grey,
                  ),
                  MorphemeText.labelMedium(
                    contactInfo,
                    color: context.color.black,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: context.color.grey,
              size: MorphemeSizes.s16,
            ),
          ],
        ),
      ),
    );
  }
}
