import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class MorphemeInputDecoration {
  static InputDecoration underline(BuildContext context) => InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey2,
            width: MorphemeSizes.s1,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey2,
            width: MorphemeSizes.s1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey2,
            width: MorphemeSizes.s1,
          ),
        ),
      );

  static InputDecoration outlined(BuildContext context) => InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey2,
            width: MorphemeSizes.s1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey2,
            width: MorphemeSizes.s1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey2,
            width: MorphemeSizes.s1,
          ),
        ),
      );

  static InputDecoration noneBorder(String hintText) => InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      );
}
