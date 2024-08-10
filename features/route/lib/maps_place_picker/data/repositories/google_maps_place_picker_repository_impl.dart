import 'package:core/core.dart';
import 'package:route/maps_place_picker/data/datasources/google_maps_place_picker_remote_data_source.dart';
import 'package:route/maps_place_picker/domain/repositories/google_maps_place_picker_repository.dart';

import '../../domain/entities/direction_entity.dart';
import '../models/body/direction_body.dart';

import '../../domain/entities/geocoding_entity.dart';
import '../models/body/geocoding_body.dart';

import '../../domain/entities/place_autocomplete_entity.dart';
import '../models/body/place_autocomplete_body.dart';

import '../../mapper.dart';

class MapsPlacePickerRepositoryImpl implements MapsPlacePickerRepository {
  MapsPlacePickerRepositoryImpl({
    required this.remoteDataSource,
  });

  final MapsPlacePickerRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, PlaceAutocompleteEntity>> placeAutocomplete(
      PlaceAutocompleteBody body) async {
    try {
      final data = await remoteDataSource.placeAutocomplete(body);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<MorphemeFailure, GeocodingEntity>> geocoding(
      GeocodingBody body) async {
    try {
      final data = await remoteDataSource.geocoding(body);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<MorphemeFailure, DirectionEntity>> direction(
      DirectionBody body) async {
    try {
      final data = await remoteDataSource.direction(body);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
