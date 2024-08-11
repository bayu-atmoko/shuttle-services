import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/detail_route_entity.dart';
import '../../domain/repositories/detail_route_repository.dart';
import '../datasources/detail_route_remote_data_source.dart';
import '../models/body/detail_route_body.dart';
import '../../mapper.dart';

class DetailRouteRepositoryImpl implements DetailRouteRepository {
  DetailRouteRepositoryImpl({
    required this.remoteDataSource,
  });

  final DetailRouteRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, DetailRouteEntity>> detailRoute(
    DetailRouteBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.detailRoute(body, headers: headers);
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
