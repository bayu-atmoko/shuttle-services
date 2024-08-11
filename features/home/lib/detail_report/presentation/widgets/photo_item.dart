import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    super.key,
    required this.photoFile,
    required this.photoUrl,
    this.onDeleteTap,
    required this.onTap,
  });

  final XFile? photoFile;
  final String? photoUrl;
  final GestureTapCallback? onDeleteTap;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MorphemeSizes.s6,
      ),
      child: Stack(
        children: [
          MorphemeTapDetector(
            onTap: onTap,
            child: Container(
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
                child: _photoFile(
                  photoFile,
                  context,
                  photoUrl,
                ),
              ),
            ),
          ),
          if (onDeleteTap != null) ...[
            Positioned(
              top: 0,
              right: 0,
              child: MorphemeTapDetector(
                onTap: onDeleteTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.color.white,
                    borderRadius: BorderRadius.circular(
                      MorphemeSizes.s25,
                    ),
                  ),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: MorphemeSizes.s25,
                    color: context.color.black,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Icon _defaultPhoto(BuildContext context) {
    return Icon(
      Icons.broken_image_outlined,
      size: MorphemeSizes.s80,
      color: context.color.white,
    );
  }

  Widget _photoFile(
    XFile? photoFile,
    BuildContext context,
    String? photoUrl,
  ) {
    final path = photoFile?.path ?? "";
    return photoFile != null && path.isNotEmpty
        ? Image.file(
            File(path),
            width: MorphemeSizes.s80,
            height: MorphemeSizes.s80,
            fit: BoxFit.cover,
          )
        : photoUrl.isNotNullOrEmpty
            ? _photoNetwork(context, photoUrl)
            : _defaultPhoto(context);
  }

  Widget _photoNetwork(BuildContext context, String? photoUrl) {
    return MorphemeImageAsset(
      photoUrl.orEmpty(),
      width: MorphemeSizes.s80,
      height: MorphemeSizes.s80,
      fit: BoxFit.cover,
      errorWidget: (
        context,
        url,
        error,
      ) =>
          _defaultPhoto(context),
    );
  }
}
