import 'package:core/core.dart';
import 'package:route/map/data/models/body/distance_matrix_body.dart';
import 'package:route/map/domain/entities/distance_matrix_entity.dart';

import '../../domain/entities/map_routes_entity.dart';
import '../models/body/map_routes_body.dart';
import '../../domain/repositories/map_repository.dart';
import '../datasources/map_remote_data_source.dart';

import '../../mapper.dart';

class MapRepositoryImpl implements MapRepository {
  MapRepositoryImpl({
    required this.remoteDataSource,
  });

  final MapRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, MapRoutesEntity>> mapRoutes(
      MapRoutesBody body) async {
    try {
      final data = await remoteDataSource.mapRoutes(body);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<MorphemeFailure, DistanceMatrixEntity>> distanceMatrix(
      DistanceMatrixBody body) async {
    try {
      final data = await remoteDataSource.distanceMatrix(body);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
