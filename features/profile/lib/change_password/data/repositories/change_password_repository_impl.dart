import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/change_password_entity.dart';
import '../../domain/repositories/change_password_repository.dart';
import '../datasources/change_password_remote_data_source.dart';
import '../models/body/change_password_body.dart';
import '../../mapper.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  ChangePasswordRepositoryImpl({
    required this.remoteDataSource,
  });

  final ChangePasswordRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, ChangePasswordEntity>> changePassword(
    ChangePasswordBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data =
          await remoteDataSource.changePassword(body, headers: headers);
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
