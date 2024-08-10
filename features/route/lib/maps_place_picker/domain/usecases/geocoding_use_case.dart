import 'package:core/core.dart';
import 'package:route/maps_place_picker/domain/repositories/google_maps_place_picker_repository.dart';

import '../../data/models/body/geocoding_body.dart';
import '../entities/geocoding_entity.dart';

class GeocodingUseCase implements UseCase<GeocodingEntity, GeocodingBody> {
  GeocodingUseCase({
    required this.repository,
  });

  final MapsPlacePickerRepository repository;

  @override
  Future<Either<MorphemeFailure, GeocodingEntity>> call(GeocodingBody body) {
    return repository.geocoding(body);
  }
}
