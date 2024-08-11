import 'package:core/src/shared/global/global_cubit.dart';
import 'package:flutter/material.dart' show BuildContext, Color;
import 'package:morpheme_library/morpheme_library.dart';

extension MorphemeColorExtension on BuildContext {
  MorphemeColor get color => read<GlobalCubit>().state.theme.color;
}

abstract base class MorphemeColor {
  Color get white;
  Color get backgroundPage;
  Color get black;
  Color get grey;
  Color get grey1;
  Color get grey2;
  Color get grey3;
  Color get grey4;
  Color get primary;
  Color get primaryDark;
  Color get primaryLighter;
  Color get primary100;
  Color get primary200;
  Color get primary300;
  Color get primary400;
  Color get primary500;
  Color get primary600;
  Color get primary700;
  Color get primary800;
  Color get primary900;
  Color get secondary;
  Color get warning;
  Color get info;
  Color get success;
  Color get error;
  Color get bgError;
  Color get bgInfo;
  Color get bgSuccess;
  Color get bgWarning;
  Color get error25;
  Color get error300;
  Color get error500;
  Color get error700;
  Color get success25;
  Color get success300;
  Color get success700;
  Color get orange25;
  Color get orange700;
  Color get purple25;
  Color get purple700;
}
