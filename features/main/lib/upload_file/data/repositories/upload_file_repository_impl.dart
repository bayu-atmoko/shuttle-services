import 'package:core/core.dart';

import '../../domain/entities/upload_file_entity.dart';
import '../../domain/repositories/upload_file_repository.dart';
import '../datasources/upload_file_remote_data_source.dart';
import '../models/body/upload_file_body.dart';
import '../../mapper.dart';

class UploadFileRepositoryImpl implements UploadFileRepository {
  UploadFileRepositoryImpl({
    required this.remoteDataSource,
  });

  final UploadFileRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, UploadFileEntity>> uploadFile(
    UploadFileBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.uploadFile(body, headers: headers);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
