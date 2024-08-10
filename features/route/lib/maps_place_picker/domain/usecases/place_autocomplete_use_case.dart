import 'package:core/core.dart';
import 'package:route/maps_place_picker/domain/repositories/google_maps_place_picker_repository.dart';

import '../../data/models/body/place_autocomplete_body.dart';
import '../entities/place_autocomplete_entity.dart';

class PlaceAutocompleteUseCase
    implements UseCase<PlaceAutocompleteEntity, PlaceAutocompleteBody> {
  PlaceAutocompleteUseCase({
    required this.repository,
  });

  final MapsPlacePickerRepository repository;

  @override
  Future<Either<MorphemeFailure, PlaceAutocompleteEntity>> call(
      PlaceAutocompleteBody body) {
    return repository.placeAutocomplete(body);
  }
}
