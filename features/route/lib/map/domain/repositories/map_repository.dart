import 'package:core/core.dart';
import 'package:route/map/data/models/body/distance_matrix_body.dart';
import 'package:route/map/domain/entities/distance_matrix_entity.dart';

import '../../data/models/body/map_routes_body.dart';
import '../entities/map_routes_entity.dart';

abstract class MapRepository {
  Future<Either<MorphemeFailure, MapRoutesEntity>> mapRoutes(
      MapRoutesBody body);
  Future<Either<MorphemeFailure, DistanceMatrixEntity>> distanceMatrix(
      DistanceMatrixBody body);
}
