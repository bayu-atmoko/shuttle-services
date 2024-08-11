import 'package:core/src/constants/src/morpheme_sizes.dart';
import 'package:core/src/themes/morpheme_colors/morpheme_colors.dart';
import 'package:flutter/material.dart';

class MorphemeCircularLoading extends StatelessWidget {
  const MorphemeCircularLoading({
    super.key,
    required this.size,
    this.strokeWidth,
    this.color,
  });

  final double size;
  final double? strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? context.color.primary,
          strokeWidth: strokeWidth ?? MorphemeSizes.s3,
        ),
      ),
    );
  }
}
