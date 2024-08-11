import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';
import 'package:route/route_recommendation/data/models/body/route_optimization_body.dart';
import 'package:route/route_recommendation/domain/entities/route_optimization_entity.dart';

import '../../domain/entities/update_route_entity.dart';
import '../models/body/update_route_body.dart';
import '../../domain/entities/create_route_entity.dart';
import '../../domain/repositories/route_recommendation_repository.dart';
import '../datasources/route_recommendation_remote_data_source.dart';
import '../models/body/create_route_body.dart';
import '../../mapper.dart';

class RouteRecommendationRepositoryImpl
    implements RouteRecommendationRepository {
  RouteRecommendationRepositoryImpl({
    required this.remoteDataSource,
  });

  final RouteRecommendationRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, CreateRouteEntity>> createRoute(
    CreateRouteBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.createRoute(body, headers: headers);
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
  Future<Either<MorphemeFailure, UpdateRouteEntity>> updateRoute(
    UpdateRouteBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.updateRoute(body, headers: headers);
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
  Future<Either<MorphemeFailure, RouteOptimizationEntity>> routeOptimization(
    RouteOptimizationBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data =
          await remoteDataSource.routeOptimization(body, headers: headers);
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
