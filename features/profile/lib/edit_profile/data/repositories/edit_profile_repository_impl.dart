import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/edit_profile_entity.dart';
import '../../domain/repositories/edit_profile_repository.dart';
import '../datasources/edit_profile_remote_data_source.dart';
import '../models/body/edit_profile_body.dart';
import '../../mapper.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  EditProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  final EditProfileRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, EditProfileEntity>> editProfile(
    EditProfileBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.editProfile(body, headers: headers);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      if (e.statusCode == 500) {
        locator<ExpiredTokenRepository>().moveToExpiredTokenPage();
      }
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
