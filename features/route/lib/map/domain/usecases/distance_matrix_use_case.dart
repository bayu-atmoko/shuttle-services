import 'package:core/core.dart';
import 'package:route/map/data/models/body/distance_matrix_body.dart';
import 'package:route/map/domain/entities/distance_matrix_entity.dart';

import '../repositories/map_repository.dart';

class DistanceMatrixUseCase
    implements UseCase<DistanceMatrixEntity, DistanceMatrixBody> {
  DistanceMatrixUseCase({
    required this.repository,
  });

  final MapRepository repository;

  @override
  Future<Either<MorphemeFailure, DistanceMatrixEntity>> call(
    DistanceMatrixBody body,
  ) {
    return repository.distanceMatrix(body);
  }
}
