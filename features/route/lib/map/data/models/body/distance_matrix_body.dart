import 'package:core/core.dart';

class DistanceMatrixBody {
  final List<DistanceMatrixModel> origins;
  final List<DistanceMatrixModel> destinations;

  DistanceMatrixBody({
    required this.origins,
    required this.destinations,
  });

  String getOriginsJoin() {
    return origins
        .map((e) => '${e.latLng.latitude},${e.latLng.longitude}')
        .join('|');
  }

  String getDestinationsJoin() {
    return destinations
        .map((e) => '${e.latLng.latitude},${e.latLng.longitude}')
        .join('|');
  }
}

class DistanceMatrixModel extends Equatable {
  const DistanceMatrixModel({
    required this.reportId,
    required this.latLng,
  });

  final int reportId;
  final LatLng latLng;

  @override
  List<Object?> get props => [
        reportId,
        latLng,
      ];
}
