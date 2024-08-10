import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MapsButton extends StatelessWidget {
  const MapsButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final GestureTapCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MorphemeTapDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(MorphemeSizes.s7),
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(
            MorphemeSizes.s30,
          ), //
          border: Border.all(
            color: context.color.grey,
            width: MorphemeSizes.s1,
          ),
        ),
        child: Icon(
          icon,
          size: MorphemeSizes.s24,
        ),
      ),
    );
  }
}
