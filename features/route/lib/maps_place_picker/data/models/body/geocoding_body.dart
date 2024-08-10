import 'package:core/core.dart';

class GeocodingBody extends Equatable {
  const GeocodingBody({
    this.placeId,
    this.key,
  });

  final String? placeId;
  final String? key;

  Map<String, dynamic> toMap() {
    return {
      if (placeId != null) 'place_id': placeId,
      if (key != null) 'key': key,
    };
  }

  @override
  List<Object?> get props => [
        placeId,
        key,
      ];
}
