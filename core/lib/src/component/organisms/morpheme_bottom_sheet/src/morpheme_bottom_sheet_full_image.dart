import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeBottomSheetFullImage extends StatelessWidget {
  const MorphemeBottomSheetFullImage({
    super.key,
    required this.photoFile,
    required this.photoUrl,
  });

  final XFile? photoFile;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final bottomPadding =
        MediaQuery.of(context).viewInsets.bottom + MorphemeSizes.s20;
    const topPadding = MorphemeSizes.s16;

    return Padding(
      padding: EdgeInsets.only(
        left: MorphemeSizes.s16,
        right: MorphemeSizes.s16,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  (topPadding +
                      bottomPadding +
                      MorphemeSizes.s16 +
                      MorphemeSizes.s140),
            ),
            decoration: BoxDecoration(
              color: context.color.grey2,
              border: Border.all(
                color: context.color.grey2,
              ),
              borderRadius: BorderRadius.circular(
                MorphemeSizes.s6,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                MorphemeSizes.s6,
              ),
              child: _photoFile(context),
            ),
          ),
          const MorphemeSpacing.vertical16(),
          MorphemeButton.elevated(
            text: context.s.close,
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  Icon _defaultPhoto(BuildContext context) {
    return Icon(
      Icons.broken_image_outlined,
      size: MorphemeSizes.s300,
      color: context.color.white,
    );
  }

  Widget _photoFile(
    BuildContext context,
  ) {
    final path = photoFile?.path ?? "";
    return photoFile != null && path.isNotEmpty
        ? Image.file(
            File(path),
            fit: BoxFit.contain,
          )
        : photoUrl.isNotNullOrEmpty
            ? _photoNetwork(context, photoUrl)
            : _defaultPhoto(context);
  }

  Widget _photoNetwork(BuildContext context, String? photoUrl) {
    return MorphemeImageAsset(
      photoUrl.orEmpty(),
      fit: BoxFit.contain,
      errorWidget: (
        context,
        url,
        error,
      ) =>
          _defaultPhoto(context),
    );
  }
}
