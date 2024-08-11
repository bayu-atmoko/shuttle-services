import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeBottomSheetUploadImage extends StatelessWidget {
  final XFile? image;
  final File? pdf;
  final String? nameFile;
  final FileCallback callbackImage;
  final BoolCallback callbackDelete;
  final FilePdfNameFileCallback? callbackFile;
  final double? maxSize;
  final bool? isDeleteMenuVisible;

  const MorphemeBottomSheetUploadImage({
    super.key,
    required this.image,
    required this.callbackImage,
    this.pdf,
    this.nameFile,
    this.callbackFile,
    this.maxSize,
    required this.callbackDelete,
    this.isDeleteMenuVisible,
  });

  const MorphemeBottomSheetUploadImage.imageAndPdf({
    super.key,
    required this.image,
    required this.callbackImage,
    required this.pdf,
    required this.nameFile,
    required this.callbackFile,
    this.maxSize,
    required this.callbackDelete,
    this.isDeleteMenuVisible,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    XFile? currentImage = image;
    File? currentPdf = pdf;
    String? currentNameFile = nameFile;

    return MorphemeBottomSheetMenu(
      tittle: context.s.changePhoto,
      closePosition: IconPosition.start,
      menuList: [
        /// pdf document
        if (callbackFile != null) ...[
          BottomSheetMenuModel(
            name: context.s.document,
            colorText: context.color.grey,
            imageAssets: Icons.description_outlined,
            onTap: () async {
              navigator.pop();
              await FilePickerHelper().pdfPicker(
                toast: () {
                  _cekToast(context);
                },
                currentPdf: currentPdf,
                nameFile: currentNameFile,
                callbackFile: callbackFile!,
                maxSize: maxSize,
              );
            },
          ),
        ],

        /// image gallery
        BottomSheetMenuModel(
          name: context.s.gallery,
          colorText: context.color.grey,
          imageAssets: Icons.image_outlined,
          onTap: () async {
            navigator.pop();
            if (Platform.isAndroid) {
              currentImage = await FilePickerHelper().imageGalleryPicker(
                toast: (value) {
                  _cekToastImage(context, value);
                },
                maxSize: maxSize,
              );
              if (currentImage != null) {
                callbackImage.call(currentImage);
              }
            } else {
              currentImage = await FilePickerHelper().imageGalleryPicker(
                toast: (value) {
                  _cekToastImage(context, value);
                },
                maxSize: maxSize,
              );
              if (currentImage != null) {
                callbackImage.call(currentImage);
              }
            }
          },
        ),

        /// camera
        BottomSheetMenuModel(
          name: context.s.camera,
          colorText: context.color.grey,
          imageAssets: Icons.camera_outlined,
          onTap: () async {
            navigator.pop();
            if (Platform.isAndroid) {
              // ignore: use_build_context_synchronously
              currentImage = await FilePickerHelper().imageCameraPicker(
                toast: (_) {
                  _cekToast(context);
                },
                maxSize: maxSize,
              );
              if (currentImage != null) {
                callbackImage.call(currentImage);
              }
            } else {
              // ignore: use_build_context_synchronously
              currentImage = await FilePickerHelper().imageCameraPicker(
                toast: (_) {
                  _cekToast(context);
                },
                maxSize: maxSize,
              );
              if (currentImage != null) {
                callbackImage.call(currentImage);
              }
            }
          },
        ),

        /// delete photo
        if (isDeleteMenuVisible != false) ...[
          BottomSheetMenuModel(
            name: context.s.deletePhoto,
            imageAssets: Icons.delete_outline,
            colorText: context.color.error,
            onTap: () {
              navigator.pop();
              callbackDelete(true);
              callbackImage(null);
            },
          ),
        ],
      ],
    );
  }

  void _cekToastImage(
    BuildContext context,
    String value,
  ) {
    if (value == 'type') {
      locator<BuildContext>().showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.selectImageFormat,
        ),
      );
    } else {
      _cekToast(context);
    }
  }

  void _cekToast(BuildContext context) {
    locator<BuildContext>().showSnackBar(
      MorphemeSnackBar.error(
        key: const ValueKey('snackbarError'),
        context: context,
        message: context.s.maximumUploadSize10MB,
      ),
    );
  }
}
