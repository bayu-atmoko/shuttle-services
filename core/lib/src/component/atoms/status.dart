import 'package:core/core.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({
    super.key,
    required this.title,
    required this.color,
    required this.background,
    required this.icon,
  });

  final String title;
  final Color color;
  final Color background;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: MorphemeSizes.s3,
      ),
      padding: const EdgeInsets.only(
        top: MorphemeSizes.s5,
        bottom: MorphemeSizes.s5,
        left: MorphemeSizes.s9,
        right: MorphemeSizes.s12,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          MorphemeSizes.s6,
        ),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: MorphemeSizes.s16,
            color: color,
          ),
          const MorphemeSpacing.horizontal4(),
          MorphemeText.labelSmall(
            title,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ],
      ),
    );
  }
}
