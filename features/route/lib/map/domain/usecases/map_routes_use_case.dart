import 'package:core/core.dart';

import '../../data/models/body/map_routes_body.dart';
import '../entities/map_routes_entity.dart';
import '../repositories/map_repository.dart';

class MapRoutesUseCase implements UseCase<MapRoutesEntity, MapRoutesBody> {
  MapRoutesUseCase({
    required this.repository,
  });

  final MapRepository repository;

  @override
  Future<Either<MorphemeFailure, MapRoutesEntity>> call(MapRoutesBody body) {
    return repository.mapRoutes(body);
  }
}
