import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/logout_entity.dart';
import '../models/body/logout_body.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import '../models/body/profile_body.dart';
import '../../mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, ProfileEntity>> profile(
    ProfileBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.profile(body, headers: headers);
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

  @override
  Future<Either<MorphemeFailure, LogoutEntity>> logout(
    LogoutBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.logout(body, headers: headers);
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
