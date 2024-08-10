import 'package:dependency_manager/dependency_manager.dart';

class ExtraPlacePicker extends Equatable {
  final LatLng? locationLatLng;
  final String? locationName;

  const ExtraPlacePicker({
    this.locationLatLng,
    this.locationName,
  });

  @override
  List<Object?> get props => [
        locationLatLng,
        locationName,
      ];
}
