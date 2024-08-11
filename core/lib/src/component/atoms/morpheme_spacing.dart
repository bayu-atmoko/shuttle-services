import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeSpacing extends StatelessWidget {
  const MorphemeSpacing.vertical({
    super.key,
    required this.size,
  }) : axis = Axis.vertical;
  const MorphemeSpacing.vertical2({super.key})
      : size = MorphemeSizes.s2,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical3({super.key})
      : size = MorphemeSizes.s3,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical4({super.key})
      : size = MorphemeSizes.s4,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical5({super.key})
      : size = MorphemeSizes.s5,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical6({super.key})
      : size = MorphemeSizes.s6,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical7({super.key})
      : size = MorphemeSizes.s7,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical8({super.key})
      : size = MorphemeSizes.s8,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical9({super.key})
      : size = MorphemeSizes.s9,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical10({super.key})
      : size = MorphemeSizes.s10,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical12({super.key})
      : size = MorphemeSizes.s12,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical16({super.key})
      : size = MorphemeSizes.s16,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical20({super.key})
      : size = MorphemeSizes.s20,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical24({super.key})
      : size = MorphemeSizes.s24,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical28({super.key})
      : size = MorphemeSizes.s28,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical32({super.key})
      : size = MorphemeSizes.s32,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical36({super.key})
      : size = MorphemeSizes.s36,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical40({super.key})
      : size = MorphemeSizes.s40,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical44({super.key})
      : size = MorphemeSizes.s44,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical48({super.key})
      : size = MorphemeSizes.s48,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical52({super.key})
      : size = MorphemeSizes.s52,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical56({super.key})
      : size = MorphemeSizes.s56,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical60({super.key})
      : size = MorphemeSizes.s60,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical64({super.key})
      : size = MorphemeSizes.s64,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical68({super.key})
      : size = MorphemeSizes.s68,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical72({super.key})
      : size = MorphemeSizes.s72,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical76({super.key})
      : size = MorphemeSizes.s76,
        axis = Axis.vertical;
  const MorphemeSpacing.vertical80({super.key})
      : size = MorphemeSizes.s80,
        axis = Axis.vertical;

  const MorphemeSpacing.horizontal({
    super.key,
    required this.size,
  }) : axis = Axis.horizontal;
  const MorphemeSpacing.horizontal3({super.key})
      : size = MorphemeSizes.s3,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal4({super.key})
      : size = MorphemeSizes.s4,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal5({super.key})
      : size = MorphemeSizes.s5,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal6({super.key})
      : size = MorphemeSizes.s6,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal7({super.key})
      : size = MorphemeSizes.s7,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal8({super.key})
      : size = MorphemeSizes.s8,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal9({super.key})
      : size = MorphemeSizes.s9,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal10({super.key})
      : size = MorphemeSizes.s10,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal12({super.key})
      : size = MorphemeSizes.s12,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal16({super.key})
      : size = MorphemeSizes.s16,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal20({super.key})
      : size = MorphemeSizes.s20,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal22({super.key})
      : size = MorphemeSizes.s22,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal24({super.key})
      : size = MorphemeSizes.s24,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal28({super.key})
      : size = MorphemeSizes.s28,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal32({super.key})
      : size = MorphemeSizes.s32,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal36({super.key})
      : size = MorphemeSizes.s36,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal40({super.key})
      : size = MorphemeSizes.s40,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal44({super.key})
      : size = MorphemeSizes.s44,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal48({super.key})
      : size = MorphemeSizes.s48,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal52({super.key})
      : size = MorphemeSizes.s52,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal56({super.key})
      : size = MorphemeSizes.s56,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal60({super.key})
      : size = MorphemeSizes.s60,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal64({super.key})
      : size = MorphemeSizes.s64,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal68({super.key})
      : size = MorphemeSizes.s68,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal72({super.key})
      : size = MorphemeSizes.s72,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal76({super.key})
      : size = MorphemeSizes.s76,
        axis = Axis.horizontal;
  const MorphemeSpacing.horizontal80({super.key})
      : size = MorphemeSizes.s80,
        axis = Axis.horizontal;

  final double size;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? SizedBox(width: size)
        : SizedBox(height: size);
  }
}
