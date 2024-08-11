import 'package:flutter/material.dart' show Color;

import 'morpheme_color.dart';

final class MorphemeColorDark extends MorphemeColor {
  static final MorphemeColorDark _instance = MorphemeColorDark._();

  factory MorphemeColorDark() {
    return _instance;
  }

  MorphemeColorDark._();

  @override
  Color get white => const Color(0xFF1E1E1E);
  @override
  Color get backgroundPage => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFFFFFFFF);
  @override
  Color get grey => const Color(0xFF979797);
  @override
  Color get grey1 => const Color(0xFFF9F9F9);
  @override
  Color get grey2 => const Color(0xFFF5F5F5);
  @override
  Color get grey3 => const Color(0xFFE5E5E5);
  @override
  Color get grey4 => const Color(0xFFCFCFCF);
  @override
  Color get primary => const Color(0xFF28A0F6);
  @override
  Color get primaryDark => const Color(0xFF005B99);
  @override
  Color get primaryLighter => const Color(0xFF00AFC1);
  @override
  Color get primary100 => const Color(0xFFE0F2FE);
  @override
  Color get primary200 => const Color(0xFFBEE3FA);
  @override
  Color get primary300 => const Color(0xFF90CDF4);
  @override
  Color get primary400 => const Color(0xFF63B3ED);
  @override
  Color get primary500 => const Color(0xFF4299E1);
  @override
  Color get primary600 => const Color(0xFF3182CE);
  @override
  Color get primary700 => const Color(0xFF2B6CB0);
  @override
  Color get primary800 => const Color(0xFF2C5282);
  @override
  Color get primary900 => const Color(0xFF2A4365);
  @override
  Color get secondary => const Color(0xFFFDA06C);
  @override
  Color get warning => const Color(0xFFDAB320);
  @override
  Color get info => const Color(0xFF00AFC1);
  @override
  Color get success => const Color(0xFF22A82F);
  @override
  Color get error => const Color(0xFFD66767);
  @override
  Color get bgError => const Color(0xFFFFECEA);
  @override
  Color get bgInfo => const Color(0xFFDFFCFF);
  @override
  Color get bgSuccess => const Color(0xFFECFFEE);
  @override
  Color get bgWarning => const Color(0xFFFFF9E3);
  @override
  Color get error25 => const Color(0xFFFFFBFA);
  @override
  Color get error300 => const Color(0xFFFDA29B);
  @override
  Color get error500 => const Color(0xFFF04438);
  @override
  Color get error700 => const Color(0xFFB42318);
  @override
  Color get success25 => const Color(0xFFF6FEF9);
  @override
  Color get success300 => const Color(0xFF6CE9A6);
  @override
  Color get success700 => const Color(0xFF027A48);
  @override
  Color get orange25 => const Color(0xFFFFF3E0);
  @override
  Color get orange700 => const Color(0xFFF2994A);
  @override
  Color get purple25 => const Color(0xFFFCE9F2);
  @override
  Color get purple700 => const Color(0xFF7C4DFF);
}
