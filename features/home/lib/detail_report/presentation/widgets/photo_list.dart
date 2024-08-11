import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/detail_report/presentation/widgets/photo_item.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({
    super.key,
    this.padding,
    this.photoFile,
    this.photoUrl,
    this.onDeleteTap,
    required this.onImageTap,
  });

  final EdgeInsets? padding;
  final List<XFile>? photoFile;
  final List<String>? photoUrl;
  final Function(int? indexFile, int? indexUrl)? onDeleteTap;
  final Function(int? indexFile, int? indexUrl)? onImageTap;

  @override
  Widget build(BuildContext context) {
    final photoFileSize = (photoFile ?? []).length;
    final photoUrlSize = (photoUrl ?? []).length;

    return SizedBox(
      height: MorphemeSizes.s80,
      child: ListView.builder(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: MorphemeSizes.s8,
            ),
        itemCount: photoFileSize + photoUrlSize,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PhotoItem(
            photoFile: photoFile != null && photoFile!.length > index
                ? photoFile![index]
                : null,
            photoUrl: index >= photoFileSize &&
                    photoUrl != null &&
                    photoUrl!.length > index - photoFileSize
                ? photoUrl![index - photoFileSize]
                : null,
            onDeleteTap: onDeleteTap != null
                ? (() {
                    /// photo from network
                    if (index >= photoFileSize) {
                      onDeleteTap!(null, index - photoFileSize);

                      /// photo from local
                    } else {
                      onDeleteTap!(index, null);
                    }
                  })
                : null,
            onTap: () {
              /// photo from network
              if (index >= photoFileSize) {
                onImageTap!(null, index - photoFileSize);

                /// photo from local
              } else {
                onImageTap!(index, null);
              }
            },
          );
        },
      ),
    );
  }
}
