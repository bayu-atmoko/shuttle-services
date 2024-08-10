import 'package:core/core.dart';

import '../models/body/direction_body.dart';
import '../models/response/direction_response.dart';
import '../models/body/geocoding_body.dart';
import '../models/response/geocoding_response.dart';
import '../models/body/place_autocomplete_body.dart';
import '../models/response/place_autocomplete_response.dart';

abstract class MapsPlacePickerRemoteDataSource {
  Future<DirectionResponse> direction(DirectionBody body);
  Future<GeocodingResponse> geocoding(GeocodingBody body);
  Future<PlaceAutocompleteResponse> placeAutocomplete(
      PlaceAutocompleteBody body);
}

class MapsPlacePickerRemoteDataSourceImpl
    implements MapsPlacePickerRemoteDataSource {
  MapsPlacePickerRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<PlaceAutocompleteResponse> placeAutocomplete(
      PlaceAutocompleteBody body) async {
    final response = await http.get(
      MorphemeEndpoints.placeAutocomplete,
      body: body.toMap(),
    );
    return PlaceAutocompleteResponse.fromJson(response.body);
  }

  @override
  Future<GeocodingResponse> geocoding(GeocodingBody body) async {
    final response = await http.get(
      MorphemeEndpoints.geocoding,
      body: body.toMap(),
    );
    return GeocodingResponse.fromJson(response.body);
  }

  @override
  Future<DirectionResponse> direction(DirectionBody body) async {
    final response = await http.get(
      MorphemeEndpoints.direction,
      body: body.toMap(),
    );
    return DirectionResponse.fromJson(response.body);
  }
}
