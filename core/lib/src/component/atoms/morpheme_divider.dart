import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum DirectionPosition { vertical, horizontal }

class MorphemeDivider extends StatelessWidget {
  final DirectionPosition? direction;
  final double? height;
  final double? width;
  final Color? color;
  final Decoration? decoration;
  final EdgeInsets? margin;

  const MorphemeDivider.horizontal({
    super.key,
    this.direction = DirectionPosition.horizontal,
    this.height,
    required this.width,
    this.color,
    this.decoration,
    this.margin,
  });

  const MorphemeDivider.vertical({
    super.key,
    this.direction = DirectionPosition.vertical,
    required this.height,
    this.width,
    this.color,
    this.decoration,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: decoration != null ? null : color ?? context.color.grey,
      height: height ?? 1,
      width: width ?? 1,
      margin: margin,
      decoration: decoration,
    );
  }
}
