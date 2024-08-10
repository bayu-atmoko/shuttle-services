import 'package:core/core.dart';
import 'package:route/maps_place_picker/domain/repositories/google_maps_place_picker_repository.dart';

import '../../data/models/body/direction_body.dart';
import '../entities/direction_entity.dart';

class DirectionUseCase implements UseCase<DirectionEntity, DirectionBody> {
  DirectionUseCase({
    required this.repository,
  });

  final MapsPlacePickerRepository repository;

  @override
  Future<Either<MorphemeFailure, DirectionEntity>> call(DirectionBody body) {
    return repository.direction(body);
  }
}
