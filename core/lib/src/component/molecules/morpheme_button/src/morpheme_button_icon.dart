import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeButtonIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget icon;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;

  const MorphemeButtonIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? MorphemeSizes.heightButton,
        decoration: BoxDecoration(
          color: color,
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: MorphemeSizes.s1,
                )
              : null,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius ?? MorphemeSizes.s10,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
