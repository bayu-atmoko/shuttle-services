import 'dart:convert';

import 'package:core/core.dart';

class UploadFileResponse extends Equatable {
  const UploadFileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataUploadFile? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory UploadFileResponse.fromMap(Map<String, dynamic> map) {
    return UploadFileResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataUploadFile.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileResponse.fromJson(String source) =>
      UploadFileResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataUploadFile extends Equatable {
  const DataUploadFile({
    required this.imageUrl,
  });

  final String? imageUrl;

  Map<String, dynamic> toMap() {
    return {
      'image_url': imageUrl,
    };
  }

  factory DataUploadFile.fromMap(Map<String, dynamic> map) {
    return DataUploadFile(
      imageUrl: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataUploadFile.fromJson(String source) =>
      DataUploadFile.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        imageUrl,
      ];
}
