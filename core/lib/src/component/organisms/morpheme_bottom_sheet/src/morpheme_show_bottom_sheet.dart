import 'package:core/core.dart';
import 'package:core/src/component/organisms/morpheme_bottom_sheet/src/morpheme_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MorphemeShowBottomSheet {
  /// show bottomSheet
  Future<dynamic> showGlobalBottomSheet(
    /// required params
    BuildContext context, {
    required String tittle,
    String? content,
    String? imageAssets,
    String? textButton,

    /// text
    Widget? widgetCheckBox,
    String? ctaContent,
    Function? callbackCTA,
    Widget? textContentWidget,
    MorphemeTextPosition? tittlePosition,
    bool? isLineTopVisible,
    IconPosition? iconPosition,

    /// button
    String? textButton2,
    EdgeInsets? paddingButton,
    bool? isDoubleButton,
    Function? onPressed,
    Function? onPressed2,
    Color? colorButton1,
    Color? colorButton2,
    Color? colorText1,
    Color? colorText2,
    Color? colorBorderButton1,
    Color? colorBorderButton2,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return MorphemeBottomSheet(
          tittle: tittle,
          content: content,
          widgetCheckBox: widgetCheckBox,
          ctaContent: ctaContent,
          textContentWidget: textContentWidget,
          imageAssets: imageAssets,
          textButton: textButton,
          textButton2: textButton2,
          paddingButton: paddingButton,
          isDoubleButton: isDoubleButton,
          colorButton1: colorButton1,
          colorButton2: colorButton2,
          colorText1: colorText1,
          colorText2: colorText2,
          callbackCTA: callbackCTA,
          onPressed: onPressed ?? () {},
          onPressed2: onPressed2,
          colorBorderButton1: colorBorderButton1,
          colorBorderButton2: colorBorderButton2,
          tittlePosition: tittlePosition ?? MorphemeTextPosition.bottom,
          iconPosition: iconPosition,
          isLineTopVisible: isLineTopVisible,
        );
      },
    );
  }

  /// show bottomSheet with double button
  Future<dynamic> showGlobalBottomSheet2Button(
    /// required params
    BuildContext context, {
    required String tittle,
    String? content,
    String? imageAssets,
    String? textButton,
    String? textButton2,
    Function? onPressed,
    required Function? onPressed2,

    /// text
    Widget? widgetCheckBox,
    String? ctaContent,
    Function? callbackCTA,
    Widget? textContentWidget,
    MorphemeTextPosition? tittlePosition,
    bool? isLineTopVisible,
    IconPosition? iconPosition,

    /// button
    EdgeInsets? paddingButton,
    bool? isDoubleButton,
    Color? colorButton1,
    Color? colorButton2,
    Color? colorText1,
    Color? colorText2,
    Color? colorBorderButton1,
    Color? colorBorderButton2,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return MorphemeBottomSheet.doubleButton(
          tittle: tittle,
          content: content,
          widgetCheckBox: widgetCheckBox,
          ctaContent: ctaContent,
          textContentWidget: textContentWidget,
          imageAssets: imageAssets,
          textButton: textButton,
          textButton2: textButton2,
          paddingButton: paddingButton,
          isDoubleButton: true,
          colorButton1: colorButton1,
          colorButton2: colorButton2,
          colorText1: colorText1,
          colorText2: colorText2,
          callbackCTA: callbackCTA,
          onPressed: onPressed,
          onPressed2: onPressed2,
          colorBorderButton1: colorBorderButton1,
          colorBorderButton2: colorBorderButton2,
          tittlePosition: tittlePosition ?? MorphemeTextPosition.bottom,
          iconPosition: iconPosition,
          isLineTopVisible: isLineTopVisible,
        );
      },
    );
  }

  /// show bottomSheet with double button
  Future<dynamic> showGlobalBottomSheetConfirmation(
    /// required params
    BuildContext context, {
    required String tittle,
    String? confirmationTitle,
    String? confirmationHint,
    String? content,
    String? imageAssets,
    String? textButton,
    String? textButton2,
    Function? onPressed,
    required StringCallback? onPressed2Confirmation,

    /// text
    Widget? widgetCheckBox,
    String? ctaContent,
    Function? callbackCTA,
    Widget? textContentWidget,
    MorphemeTextPosition? tittlePosition,
    bool? isLineTopVisible,
    IconPosition? iconPosition,

    /// button
    EdgeInsets? paddingButton,
    bool? isDoubleButton,
    Color? colorButton1,
    Color? colorButton2,
    Color? colorText1,
    Color? colorText2,
    Color? colorBorderButton1,
    Color? colorBorderButton2,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return MorphemeBottomSheet.doubleButton(
          tittle: tittle,
          content: content,
          widgetCheckBox: widgetCheckBox,
          ctaContent: ctaContent,
          textContentWidget: textContentWidget,
          imageAssets: imageAssets,
          textButton: textButton,
          textButton2: textButton2,
          paddingButton: paddingButton,
          isDoubleButton: true,
          colorButton1: colorButton1,
          colorButton2: colorButton2,
          colorText1: colorText1,
          colorText2: colorText2,
          callbackCTA: callbackCTA,
          onPressed: onPressed,
          onPressed2: null,
          onPressed2Confirmation: onPressed2Confirmation,
          colorBorderButton1: colorBorderButton1,
          colorBorderButton2: colorBorderButton2,
          tittlePosition: tittlePosition ?? MorphemeTextPosition.bottom,
          iconPosition: iconPosition,
          isLineTopVisible: isLineTopVisible,
          confirmationTitle: confirmationTitle,
          confirmationHint: confirmationHint,
        );
      },
    );
  }
}
