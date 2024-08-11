import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:core/core.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class FileHelper {
  Future<String> getFileSize(int bytes) async {
    if (bytes < 1024) {
      return '$bytes bytes';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }

  Future<bool> checkIsFileExists(String path) async {
    return await File(path).exists();
  }

  String getExtensionFile(String path) {
    return p.extension(path);
  }

  String getBasename(String path) {
    return p.basename(path);
  }

  Future<File> compressImage(File file, int maxSizeInBytes) async {
    final filePath = file.absolute.path;
    final fileSize = await file.length();
    final maxFileSize = maxSizeInBytes;

    // Check if the file is already smaller than the maximum size
    if (fileSize <= maxFileSize) {
      return file;
    }

    // Calculate the quality for compression
    int quality = (maxFileSize / fileSize * 100).floor();
    final compressedImage = await FlutterImageCompress.compressWithFile(
      filePath,
      quality: quality,
    );

    int compressedFileSize = compressedImage!.length;

    // If the compressed file is still larger than the maximum size,
    // keep reducing the quality until it meets the size requirement
    while (compressedFileSize > maxFileSize) {
      quality -= 5;
      final compressedImage = await FlutterImageCompress.compressWithFile(
        filePath,
        quality: quality,
      );
      compressedFileSize = compressedImage!.length;
    }

    final compressedFile = File(filePath)..writeAsBytesSync(compressedImage);

    return compressedFile;
  }

  Future<String?> convertAudioToBase64(String filePath) async {
    try {
      File file = File(filePath);

      if (await file.exists()) {
        List<int> fileBytes = await file.readAsBytes();
        String base64String = base64Encode(fileBytes);
        return base64String;
      } else {
        throw Exception('File does not exist');
      }
    } catch (e) {
      return null;
    }
  }

  Future<File?> decodeBase64ToFile(String? base64) async {
    if (base64.isNotNullOrEmpty) {
      final Uint8List data = base64Decode(base64!);
      final directory = await getApplicationDocumentsDirectory();
      var fileAudio = File('${directory.path}/nc-ai.wav');

      /// delete old files
      if (await fileAudio.exists()) {
        await fileAudio.delete();
      }
      await fileAudio.writeAsBytes(List.from(data), mode: FileMode.write);
      return fileAudio;
    } else {
      return null;
    }
  }
}
