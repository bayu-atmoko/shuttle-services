// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:core/core.dart';

class FilePickerHelper {
  Future<void> pdfPicker({
    required Function toast,
    required File? currentPdf,
    required String? nameFile,
    required FilePdfNameFileCallback callbackFile,
    double? maxSize,
  }) async {
    final permission = await PermissionHelper.permissionStorage();
    final granted = await PermissionHelper.requestSinglePermission(
      permission,
    );
    if (!granted) return;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      nameFile = result.files.single.name;
      currentPdf = File(result.files.single.path!);

      final bytes = currentPdf.readAsBytesSync().lengthInBytes;
      double sizeInMb = bytes / (1024 * 1024);

      if (sizeInMb > (maxSize ?? 10)) {
        toast;
      } else {
        callbackFile(currentPdf, nameFile);
      }
    }
  }

  Future<XFile?> imagePicker(
    ImageSource source, {
    StringCallback? toast,
    int? imageQuality,
  }) {
    if (source == ImageSource.camera) {
      return imageCameraPicker(
        toast: toast,
        imageQuality: imageQuality,
      );
    } else {
      return imageGalleryPicker(
        toast: toast,
        imageQuality: imageQuality,
      );
    }
  }

  Future<XFile?> imageGalleryPicker({
    StringCallback? toast,
    double? maxSize,
    int? imageQuality,
  }) async {
    try {
      final permission = await PermissionHelper.permissionStorage();
      final granted = await PermissionHelper.requestSinglePermission(
        permission,
      );
      if (!granted) return null;

      /// pick image from gallery
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
      );

      if (pickedFile?.path != null) {
        /// check original image size
        final File oriFile = File(pickedFile!.path);
        final oriBytes = oriFile.lengthSync();
        double oriSizeInMb = oriBytes / (1024 * 1024);

        if (oriSizeInMb > (maxSize ?? 10)) {
          toast?.call('');
        } else {
          /// fix the image rotation
          // XFile resultXFile = XFile(
          //     (await FlutterExifRotation.rotateAndSaveImage(
          //             path: pickedFile.path))
          //         .path);

          /// check image size after fixing
          final File fixingFile = File(pickedFile.path);
          final fixingBytes = fixingFile.lengthSync();
          double fixingSizeInMb = fixingBytes / (1024 * 1024);

          if (fixingSizeInMb > (maxSize ?? 10)) {
            /// compress the image
            Uint8List? resultCompress =
                await FlutterImageCompress.compressWithFile(
              pickedFile.path,
              quality: 100,
            );

            if (resultCompress != null) {
              /// save to temporary file
              final tempDir = await getTemporaryDirectory();
              File compressFile = await File(
                      '${tempDir.path}/${DateTime.now().day + DateTimeHelper.getIntDateNowSecond()}.jpg')
                  .create();
              compressFile.writeAsBytesSync(resultCompress);
              XFile? compressXFile = XFile(compressFile.path);

              /// check image size after compress
              final compressBytes = compressFile.lengthSync();
              double compressSizeInMb = compressBytes / (1024 * 1024);

              if (compressSizeInMb > (maxSize ?? 10)) {
                toast?.call('');

                /// compress image
              } else {
                if (pickedFile.name.contains('.')) {
                  String? type = pickedFile.name.split('.').last.toLowerCase();
                  if (type == 'png' || type == 'jpg' || type == 'jpeg') {
                    return compressXFile;
                  } else {
                    toast?.call('type');
                  }
                } else {
                  return compressXFile;
                }
              }

              /// image after fix rotation
            } else {
              if (pickedFile.name.contains('.')) {
                String? type = pickedFile.name.split('.').last.toLowerCase();
                if (type == 'png' || type == 'jpg' || type == 'jpeg') {
                  return pickedFile;
                } else {
                  toast?.call('type');
                }
              } else {
                return pickedFile;
              }
            }

            /// image after fix rotation
          } else {
            if (pickedFile.name.contains('.')) {
              String? type = pickedFile.name.split('.').last.toLowerCase();
              if (type == 'png' || type == 'jpg' || type == 'jpeg') {
                return pickedFile;
              } else {
                toast?.call('type');
              }
            } else {
              return pickedFile;
            }
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<XFile?> imageCameraPicker({
    StringCallback? toast,
    double? maxSize,
    int? imageQuality = 50,
  }) async {
    final granted = await PermissionHelper.requestSinglePermission(
      Permission.camera,
    );
    if (!granted) return null;

    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1920,
        maxWidth: 1920,
        imageQuality: imageQuality,
        requestFullMetadata: false,
      );

      if (pickedFile?.path != null) {
        /// check original image size
        final File oriFile = File(pickedFile!.path);
        final oriBytes = oriFile.lengthSync();
        double oriSizeInMb = oriBytes / (1024 * 1024);

        if (oriSizeInMb > (maxSize ?? 10)) {
          toast?.call('');
        } else {
          /// fix the image rotation
          // XFile resultXFile = XFile(
          //     (await FlutterExifRotation.rotateAndSaveImage(
          //             path: pickedFile.path))
          //         .path);

          /// check image size after fixing
          final File fixingFile = File(pickedFile.path);
          final fixingBytes = fixingFile.lengthSync();
          double fixingSizeInMb = fixingBytes / (1024 * 1024);

          if (fixingSizeInMb > (maxSize ?? 10)) {
            /// compress the image
            Uint8List? resultCompress =
                await FlutterImageCompress.compressWithFile(
              pickedFile.path,
              quality: 100,
            );

            if (resultCompress != null) {
              /// save to temporary file
              final tempDir = await getTemporaryDirectory();
              File compressFile = await File(
                      '${tempDir.path}/${DateTime.now().day + DateTimeHelper.getIntDateNowSecond()}.jpg')
                  .create();
              compressFile.writeAsBytesSync(resultCompress);
              XFile? compressXFile = XFile(compressFile.path);

              /// check image size after compress
              final compressBytes = compressFile.lengthSync();
              double compressSizeInMb = compressBytes / (1024 * 1024);

              if (compressSizeInMb > (maxSize ?? 10)) {
                toast?.call('');

                /// compress image
              } else {
                return compressXFile;
              }

              /// image after fix rotation
            } else {
              return pickedFile;
            }

            /// image after fix rotation
          } else {
            return pickedFile;
          }
        }
      }

      /// original image
      return pickedFile;
    } catch (e) {
      return null;
    }
  }
}
