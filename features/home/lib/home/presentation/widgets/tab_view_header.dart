import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TabViewHeader extends StatelessWidget {
  final String title;
  final bool isActive;

  const TabViewHeader({
    super.key,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MorphemeSizes.s140,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: MorphemeSizes.s7,
      ),
      decoration: BoxDecoration(
        color: isActive ? context.color.primary100 : context.color.grey3,
        borderRadius: BorderRadius.circular(
          MorphemeSizes.s30,
        ),
        border: isActive ? Border.all(color: context.color.primaryDark) : null,
      ),
      child: MorphemeText.labelExtraLarge(
        title,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
      ),
    );
  }
}
