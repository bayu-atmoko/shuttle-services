import 'package:core/core.dart';

import '../../data/models/body/direction_body.dart';
import '../entities/direction_entity.dart';
import '../../data/models/body/geocoding_body.dart';
import '../entities/geocoding_entity.dart';
import '../../data/models/body/place_autocomplete_body.dart';
import '../entities/place_autocomplete_entity.dart';

abstract class MapsPlacePickerRepository {
  Future<Either<MorphemeFailure, PlaceAutocompleteEntity>> placeAutocomplete(
      PlaceAutocompleteBody body);
  Future<Either<MorphemeFailure, GeocodingEntity>> geocoding(
      GeocodingBody body);
  Future<Either<MorphemeFailure, DirectionEntity>> direction(
      DirectionBody body);
}
