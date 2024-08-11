import 'package:core/core.dart';

import '../../data/models/body/upload_file_body.dart';
import '../entities/upload_file_entity.dart';
import '../repositories/upload_file_repository.dart';

class UploadFileUseCase implements UseCase<UploadFileEntity, UploadFileBody> {
  UploadFileUseCase({
    required this.repository,
  });

  final UploadFileRepository repository;

  @override
  Future<Either<MorphemeFailure, UploadFileEntity>> call(
    UploadFileBody body, {
    Map<String, String>? headers,
  }) {
    return repository.uploadFile(body, headers: headers);
  }
}
