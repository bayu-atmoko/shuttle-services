part of 'geocoding_bloc.dart';

@immutable
abstract class GeocodingEvent extends Equatable {}

class FetchGeocoding extends GeocodingEvent {
  FetchGeocoding(this.body);

  final GeocodingBody body;

  @override
  List<Object?> get props => [body];
}
