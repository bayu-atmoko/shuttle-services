import 'package:core/core.dart';

class UploadFileEntity extends Equatable {
  const UploadFileEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataUploadFile? data;

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

  @override
  List<Object?> get props => [
        imageUrl,
      ];
}
