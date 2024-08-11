import 'dart:async';
import 'package:location/location.dart';
import 'package:route/maps_place_picker/presentation/bloc/direction/direction_bloc.dart';
import 'package:route/maps_place_picker/presentation/bloc/place_autocomplete/place_autocomplete_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/maps_place_picker/data/models/body/geocoding_body.dart';
import 'package:route/maps_place_picker/data/models/body/place_autocomplete_body.dart';
import 'package:route/maps_place_picker/domain/entities/place_autocomplete_entity.dart';
import 'package:route/maps_place_picker/presentation/bloc/geocoding/geocoding_bloc.dart';
import 'dart:math' as math;

import '../pages/google_maps_place_picker_page.dart';

part 'google_maps_place_picker_state.dart';

class MapsPlacePickerCubit extends MorphemeCubit<MapsPlacePickerStateCubit> {
  MapsPlacePickerCubit({
    required this.directionBloc,
    required this.placeAutocompleteBloc,
    required this.geocodingBloc,
  }) : super(const MapsPlacePickerStateCubit(
          initialLatLng: LatLng(-6.9084616, 107.614289),
          autocompleteSearch: [],
          locationName: '',
        ));

  final String uuid = const Uuid().v4();
  final Debouncer debouncer = Debouncer();

  final PlaceAutocompleteBloc placeAutocompleteBloc;
  final GeocodingBloc geocodingBloc;
  final DirectionBloc directionBloc;
  final Completer<GoogleMapController> mapsCompleter = Completer();
  GoogleMapController? mapsController;

  @override
  void initState(BuildContext context) async {
    _getInitialCurrentLocation();
  }

  @override
  void initArgument<Page>(BuildContext context, Page widget) async {
    super.initArgument(context, widget);
    if (widget is! MapsPlacePickerPage) return;

    final initialLocation = widget.pageParams.locationLatLng;
    if (initialLocation?.latitude != null &&
        initialLocation?.longitude != null) {
      final latLng = LatLng(
        initialLocation!.latitude,
        initialLocation.longitude,
      );
      emit(state.copyWith(
        latLng: latLng,
        initialLatLng: latLng,
      ));
    }
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<PlaceAutocompleteBloc>(
            create: (context) => placeAutocompleteBloc),
        BlocProvider<GeocodingBloc>(create: (context) => geocodingBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<PlaceAutocompleteBloc, PlaceAutocompleteState>(
            listener: _listenerPlaceAutocomplete),
        BlocListener<GeocodingBloc, GeocodingState>(
            listener: _listenerGeocoding),
      ];

  @override
  void dispose() {
    placeAutocompleteBloc.close();
    geocodingBloc.close();
    debouncer.close();
  }

  void initLocation() async {
    LatLng? currentLocation = await getCurrentLatLng();
    if (mounted) {
      emit(state.copyWith(
        latLng: state.latLng ?? currentLocation,
        initialLatLng: state.latLng ?? currentLocation,
      ));

      if (state.latLng != null) {
        state.latLng?.run((it) => updateCamera(it));
      } else {
        currentLocation?.run((it) => updateCamera(it));
      }
    }
  }

  Future<LatLng?> getCurrentLatLng() async {
    Position? position;
    if (await PermissionHelper.askLocationPermission()) {
      position = await Geolocator.getLastKnownPosition();
      position ??= await Geolocator.getCurrentPosition();
    }
    if (position != null) {
      return LatLng(position.latitude, position.longitude);
    }
    return null;
  }

  void onMapsCreated(GoogleMapController controller) async {
    if (!mapsCompleter.isCompleted) {
      mapsCompleter.complete(controller);
      mapsController = await mapsCompleter.future;
      initLocation();
    } else {
      mapsController = controller;
    }

    emit(state.copyWith(
      isLoading: false,
    ));
  }

  void updateCamera(LatLng latLng) async {
    if (mapsController == null) return;
    mapsController!.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onSelectLocationPointPressed(BuildContext context) {
    context.pop(ExtraPlacePicker(
      locationLatLng: state.latLng,
      locationName: state.locationName,
    ));
  }

  void _onLatLngChanged(LatLng value) => emit(state.copyWith(latLng: value));

  void onSearchChanged(String value) {
    debouncer.run(() {
      if (value.isEmpty) {
        emit(state.copyWith(autocompleteSearch: []));
      } else {
        fetchPlaceAutocomplete(value);
      }
    });
  }

  void onAutocompleteSearchPressed(PredictionsPlaceAutocomplete place) {
    if (mapsController == null) return;
    emit(state.copyWith(autocompleteSearch: []));
    fetchGeocoding(place.placeId ?? '');
  }

  void fetchPlaceAutocomplete(String query) {
    placeAutocompleteBloc.add(
      FetchPlaceAutocomplete(
        PlaceAutocompleteBody(
          input: query,
          sessiontoken: uuid,
          key: Environment.mapsApiKey,
        ),
      ),
    );
  }

  void fetchGeocoding(String placeId) {
    geocodingBloc.add(
      FetchGeocoding(
        GeocodingBody(
          placeId: placeId,
          key: Environment.mapsApiKey,
        ),
      ),
    );
  }

  void _listenerPlaceAutocomplete(
    BuildContext context,
    PlaceAutocompleteState state,
  ) {
    state.when(
      onSuccess: (state) => emit(
        this.state.copyWith(
            autocompleteSearch: state.data.predictions?.take(5).toList()),
      ),
    );
  }

  void _listenerGeocoding(BuildContext context, GeocodingState state) {
    state.when(
      onSuccess: (state) {
        if (state.data.results?.isNotEmpty ?? false) {
          final lat = state.data.results?.first.geometry?.location?.lat;
          final lng = state.data.results?.first.geometry?.location?.lng;
          if (lat != null && lng != null) {
            final latLng = LatLng(lat, lng);
            final result =
                state.data.results != null && state.data.results!.isNotEmpty
                    ? state.data.results?.first
                    : null;

            bool isLocationValid = onMapTap(context, latLng);
            if (isLocationValid) {
              // TODO location name
              emit(this.state.copyWith(
                    latLng: latLng,
                    locationName: result?.formattedAddress ?? '',
                  ));
              updateCamera(latLng);
            }
          }
        }
      },
    );
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    // Earth's radius in meters
    const double earthRadius = 6371000;

    double dLat = _degreeToRadian(point2.latitude - point1.latitude);
    double dLon = _degreeToRadian(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreeToRadian(point1.latitude)) *
            math.cos(_degreeToRadian(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreeToRadian(double degree) {
    return degree * math.pi / 180;
  }

  bool isWithinRadius(LatLng currentLocation, LatLng point, double radius) {
    double distance = calculateDistance(currentLocation, point);
    return distance <= radius;
  }

  void _getInitialCurrentLocation() async {
    Location location = _getLatLngCurrentLocation();
    location.onLocationChanged.listen(
      (newLoc) {
        emit(state.copyWith(
          currentLocation: newLoc,
        ));
      },
    );
  }

  Location _getLatLngCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        emit(state.copyWith(
          currentLocation: location,
        ));
      },
    );
    return location;
  }

  bool onMapTap(BuildContext context, LatLng value) {
    _onLatLngChanged(value);
    return true;
  }

  void getCurrentLocation() {
    _getLatLngCurrentLocation();
    _moveToCurrentLocation();
  }

  void _moveToCurrentLocation() async {
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(
        state.currentLocation?.latitude ?? 0.0,
        state.currentLocation?.longitude ?? 0.0,
      ),
      MorphemeInt.mapsZoom,
    );
    mapsController?.animateCamera(cameraUpdate);
  }
}
