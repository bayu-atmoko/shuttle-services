import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MorphemeBottomSheet extends StatefulWidget {
  /// text
  final String tittle;
  final String? content;
  final Widget? widgetCheckBox;
  final String? ctaContent;
  final Function? callbackCTA;
  final Widget? textContentWidget;
  final MorphemeTextPosition? tittlePosition;
  final bool? isLineTopVisible;
  final IconPosition? iconPosition;

  /// image
  final String? imageAssets;

  /// button
  final String? textButton;
  final String? textButton2;
  final EdgeInsets? paddingButton;
  final bool? isDoubleButton;
  final Function? onPressed;
  final Function? onPressed2;
  final StringCallback? onPressed2Confirmation;
  final Color? colorButton1;
  final Color? colorButton2;
  final Color? colorText1;
  final Color? colorText2;
  final Color? colorBorderButton1;
  final Color? colorBorderButton2;

  /// confirmation
  final String? confirmationTitle;
  final String? confirmationHint;

  const MorphemeBottomSheet({
    super.key,
    required this.tittle,
    this.content,
    this.widgetCheckBox,
    this.ctaContent,
    this.callbackCTA,
    this.imageAssets,
    this.textButton,
    this.textButton2,
    this.paddingButton,
    this.isDoubleButton,
    required this.onPressed,
    this.onPressed2,
    this.colorButton1,
    this.colorButton2,
    this.colorText1,
    this.colorText2,
    this.textContentWidget,
    this.colorBorderButton1,
    this.colorBorderButton2,
    this.tittlePosition = MorphemeTextPosition.bottom,
    this.isLineTopVisible,
    this.iconPosition,
    this.onPressed2Confirmation,
    this.confirmationTitle,
    this.confirmationHint,
  });

  const MorphemeBottomSheet.doubleButton({
    super.key,
    required this.tittle,
    required this.content,
    this.widgetCheckBox,
    this.ctaContent,
    this.callbackCTA,
    required this.imageAssets,
    required this.textButton,
    required this.textButton2,
    this.paddingButton,
    this.isDoubleButton = true,
    required this.onPressed,
    this.onPressed2,
    this.colorButton1,
    this.colorButton2,
    this.colorText1,
    this.colorText2,
    this.textContentWidget,
    this.colorBorderButton1,
    this.colorBorderButton2,
    this.tittlePosition = MorphemeTextPosition.top,
    this.isLineTopVisible,
    this.iconPosition,
    this.onPressed2Confirmation,
    this.confirmationTitle,
    this.confirmationHint,
  });

  const MorphemeBottomSheet.singleButton({
    super.key,
    required this.tittle,
    required this.content,
    this.widgetCheckBox,
    this.ctaContent,
    this.callbackCTA,
    required this.imageAssets,
    required this.textButton,
    this.textButton2,
    this.paddingButton,
    this.isDoubleButton,
    required this.onPressed,
    this.onPressed2,
    this.colorButton1,
    this.colorButton2,
    this.colorText1,
    this.colorText2,
    this.textContentWidget,
    this.colorBorderButton1,
    this.colorBorderButton2,
    this.tittlePosition = MorphemeTextPosition.top,
    this.isLineTopVisible,
    this.iconPosition,
    this.onPressed2Confirmation,
    this.confirmationTitle,
    this.confirmationHint,
  });

  const MorphemeBottomSheet.singleButtonWithCta({
    super.key,
    required this.tittle,
    required this.content,
    this.widgetCheckBox,
    required this.ctaContent,
    required this.callbackCTA,
    required this.imageAssets,
    required this.textButton,
    this.textButton2,
    this.paddingButton,
    this.isDoubleButton,
    required this.onPressed,
    this.onPressed2,
    this.colorButton1,
    this.colorButton2,
    this.colorText1,
    this.colorText2,
    this.textContentWidget,
    this.colorBorderButton1,
    this.colorBorderButton2,
    this.tittlePosition = MorphemeTextPosition.top,
    this.isLineTopVisible,
    this.iconPosition,
    this.onPressed2Confirmation,
    this.confirmationTitle,
    this.confirmationHint,
  });

  const MorphemeBottomSheet.doubleButtonWithTextField({
    super.key,
    required this.tittle,
    required this.content,
    this.widgetCheckBox,
    this.ctaContent,
    this.callbackCTA,
    required this.imageAssets,
    required this.textButton,
    required this.textButton2,
    this.paddingButton,
    this.isDoubleButton = true,
    required this.onPressed,
    this.onPressed2,
    this.colorButton1,
    this.colorButton2,
    this.colorText1,
    this.colorText2,
    this.textContentWidget,
    this.colorBorderButton1,
    this.colorBorderButton2,
    this.tittlePosition = MorphemeTextPosition.top,
    this.isLineTopVisible,
    this.iconPosition,
    required this.onPressed2Confirmation,
    this.confirmationTitle,
    this.confirmationHint,
  });

  @override
  State<MorphemeBottomSheet> createState() => _MorphemeBottomSheetState();
}

class _MorphemeBottomSheetState extends State<MorphemeBottomSheet> {
  /// confirmation
  final confirmationKey = GlobalKey<MorphemeTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 2.720,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// header
          if (widget.tittlePosition == MorphemeTextPosition.top &&
              widget.tittle.isNotEmpty) ...[
            MorphemeHeaderBottomSheet(
              title: widget.tittle,
              iconPosition: widget.iconPosition,
              isLineTopVisible: widget.isLineTopVisible,
            ),
          ],
          const SizedBox(height: 20),

          /// image
          widget.imageAssets.isNotNullOrEmpty
              ? MorphemeImageAsset(
                  widget.imageAssets.orEmpty(),
                  width: 320,
                  height: 181,
                  fit: BoxFit.contain,
                )
              : Icon(
                  Icons.support_agent_rounded,
                  size: 181,
                  color: context.color.grey,
                ),

          /// tittle
          if (widget.tittlePosition == MorphemeTextPosition.bottom &&
              widget.tittle.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
              child: MorphemeText.titleMedium(
                widget.tittle,
                maxLines: 2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
          ] else ...[
            const SizedBox(height: 20),
          ],

          /// content text
          if (widget.content.isNotNullOrEmpty) ...[
            const SizedBox(height: 6),

            /// content text with CTA
            if (widget.ctaContent != null && widget.ctaContent!.isNotEmpty) ...[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: MorphemeTextRich.bodyMedium(
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          if (widget.callbackCTA != null) {
                            widget.callbackCTA!();
                          }
                        },
                      text: widget.ctaContent,
                      style: const TextStyle().copyWith(
                        color: context.color.primary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              /// content text without CTA
            ] else ...[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: widget.textContentWidget ??
                    (widget.widgetCheckBox != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.content.orEmpty(),
                                textAlign: TextAlign.start,
                              ),

                              /// checkbox
                              widget.widgetCheckBox ?? Container(),
                            ],
                          )
                        : Text(
                            widget.content.orEmpty(),
                            textAlign: TextAlign.start,
                          )),
              ),
            ],
          ],

          /// text field confirmation
          if (widget.onPressed2Confirmation != null) ...[
            const MorphemeSpacing.vertical16(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MorphemeSizes.s16,
              ),
              child: MorphemeTextField(
                key: confirmationKey,
                title: widget.confirmationTitle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: widget.confirmationHint),
                validator: ValidatorValueHelper.validatorEmpty,
                maxLines: 4,
              ),
            ),
          ],

          const SizedBox(height: 10),

          /// double button
          widget.isDoubleButton != null && widget.isDoubleButton == true
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: MorphemeSizes.s16,
                    right: MorphemeSizes.s16,
                    top: MorphemeSizes.s10,
                    bottom: MorphemeSizes.s20,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// button 1
                      Expanded(
                        child: MorphemeButton.outlined(
                          text: widget.textButton ?? context.s.no,
                          onPressed: () {
                            if (widget.onPressed != null) {
                              widget.onPressed!();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                      const MorphemeSpacing.horizontal16(),

                      /// button 2
                      Expanded(
                        child: MorphemeButton.elevated(
                          text: widget.textButton2 ?? context.s.yes,
                          onPressed: () {
                            if (widget.onPressed2Confirmation != null) {
                              widget.onPressed2Confirmation!(
                                confirmationKey.text,
                              );
                            } else if (widget.onPressed2 != null) {
                              widget.onPressed2!();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )

              /// single button
              : MorphemeButton.elevated(
                  text: widget.textButton ?? context.s.close,
                  onPressed: () {
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                )
        ],
      ),
    );
  }
}
