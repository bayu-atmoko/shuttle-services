import 'package:core/src/component/atoms/morpheme_spacing.dart';
import 'package:core/src/component/atoms/morpheme_tap_detector.dart';
import 'package:core/src/component/atoms/morpheme_text.dart';
import 'package:core/src/constants/src/morpheme_sizes.dart';
import 'package:core/src/extensions/src/localization_extension.dart';
import 'package:core/src/themes/morpheme_colors/morpheme_colors.dart';
import 'package:flutter/material.dart';

class MorphemeUploadButton extends StatelessWidget {
  const MorphemeUploadButton({
    super.key,
    this.tittle,
    this.tittleButton,
    this.heightButton,
    required this.onTap,
  });

  final String? tittle;
  final String? tittleButton;
  final double? heightButton;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tittle != null && tittle!.isNotEmpty) ...[
          MorphemeText.labelLarge(tittle!),
          const MorphemeSpacing.vertical8(),
        ],
        MorphemeTapDetector(
          onTap: onTap,
          child: Container(
            height: heightButton ?? MorphemeSizes.s50,
            decoration: BoxDecoration(
              color: context.color.grey2,
              borderRadius: BorderRadius.circular(
                MorphemeSizes.s8,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_upload_outlined,
                  size: MorphemeSizes.s20,
                  color: context.color.grey,
                ),
                const MorphemeSpacing.horizontal8(),
                MorphemeText.labelLarge(
                  tittleButton ?? context.s.uploadGarbagePhoto,
                  color: context.color.grey,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
