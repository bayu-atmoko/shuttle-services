import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/list_route_entity.dart';
import '../../domain/repositories/list_route_repository.dart';
import '../datasources/list_route_remote_data_source.dart';
import '../models/body/list_route_body.dart';
import '../../mapper.dart';

class ListRouteRepositoryImpl implements ListRouteRepository {
  ListRouteRepositoryImpl({
    required this.remoteDataSource,
  });

  final ListRouteRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, ListRouteEntity>> listRoute(
    ListRouteBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.listRoute(body, headers: headers);
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
