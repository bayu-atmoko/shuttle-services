import 'dart:io';
import 'package:core/core.dart';

class UploadFileBody extends Equatable {
  const UploadFileBody({
    required this.files,
    required this.type,
  });

  final Map<String, File>? files;
  final String? type;

  Map<String, dynamic> toMap() {
    return {
      if (type != null) 'type': type,
    };
  }

  @override
  List<Object?> get props => [
        files,
        type,
      ];
}

class MultipleUploadFileBody extends Equatable {
  const MultipleUploadFileBody({
    required this.files,
    required this.type,
  });

  final List<Map<String, File>>? files;
  final String? type;

  Map<String, dynamic> toMap() {
    return {
      if (type != null) 'type': type,
    };
  }

  @override
  List<Object?> get props => [
        files,
        type,
      ];
}
