import 'package:core/core.dart';

import '../../data/models/body/upload_file_body.dart';
import '../entities/upload_file_entity.dart';

abstract class UploadFileRepository {
  Future<Either<MorphemeFailure, UploadFileEntity>> uploadFile(
    UploadFileBody body, {
    Map<String, String>? headers,
  });
}
