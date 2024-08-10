part of 'google_maps_place_picker_cubit.dart';

class MapsPlacePickerStateCubit extends Equatable {
  const MapsPlacePickerStateCubit({
    required this.initialLatLng,
    this.latLng,
    required this.locationName,
    required this.autocompleteSearch,
    this.isLoading = true,
    this.currentLocation,
  });

  final LatLng? latLng;
  final LatLng initialLatLng;
  final String locationName;
  final List<PredictionsPlaceAutocomplete> autocompleteSearch;
  final bool isLoading;
  final LocationData? currentLocation;

  MapsPlacePickerStateCubit copyWith({
    LatLng? initialLatLng,
    LatLng? latLng,
    String? locationName,
    List<PredictionsPlaceAutocomplete>? autocompleteSearch,
    bool? isLoading,
    LocationData? currentLocation,
  }) {
    return MapsPlacePickerStateCubit(
      initialLatLng: initialLatLng ?? this.initialLatLng,
      latLng: latLng ?? this.latLng,
      locationName: locationName ?? this.locationName,
      autocompleteSearch: autocompleteSearch ?? this.autocompleteSearch,
      isLoading: isLoading ?? this.isLoading,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }

  @override
  List<Object?> get props => [
        initialLatLng,
        latLng,
        locationName,
        autocompleteSearch,
        isLoading,
        currentLocation,
      ];
}
