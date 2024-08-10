import 'dart:async';
import 'dart:math';

import 'package:core/core.dart';
import 'package:route/map/data/models/body/map_routes_body.dart';
import 'package:route/map/domain/entities/map_routes_entity.dart'
    as routes_entity;
import 'package:route/map/presentation/bloc/map_routes/map_routes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:route/map/presentation/pages/map_page.dart';

part 'map_state.dart';

class MapCubit extends MorphemeCubit<MapStateCubit> {
  MapCubit({
    required this.mapRoutesBloc,
  }) : super(const MapStateCubit(
          polyLineCoordinates: [],
          zoom: MorphemeInt.mapsZoom,
        ));

  final MapRoutesBloc mapRoutesBloc;

  final Completer<GoogleMapController> controller = Completer();
  bool isInitialCamera = false;

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState(BuildContext context) {
    _getInitialCurrentLocation(context);
  }

  @override
  void initArgument<Page>(BuildContext context, Page widget) async {
    super.initArgument(context, widget);
    if (widget is! MapPage) return;

    final initialLocation = widget.pageParams?.locationLatLng;
    if (initialLocation?.latitude != null &&
        initialLocation?.longitude != null) {
      final latLng = LatLng(
        initialLocation!.latitude,
        initialLocation.longitude,
      );
      emit(state.copyWith(
        markerReportLatLng: [latLng],
      ));
    }
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<MapRoutesBloc>(create: (context) => mapRoutesBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<MapRoutesBloc, MapRoutesState>(
            listener: _listenerMapRoutes),
      ];

  @override
  void dispose() {
    mapRoutesBloc.close();
  }

  void _listenerMapRoutes(BuildContext context, MapRoutesState state) {
    state.when(
      onLoading: (_) =>
          MorphemeCircularLoadingDialog.showLoadingDialog(context, _keyLoader),
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        _showTechnicalErrorMessage(context);
      },
      onSuccess: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        List<routes_entity.LegsMapRoutes>? legs =
            (state.data.routes ?? []).isNotEmpty
                ? state.data.routes!.first.legs
                : [];

        List<routes_entity.StepsMapRoutes>? steps = [];
        for (var element in (legs ?? [])) {
          if (element.steps != null) {
            steps.addAll((element.steps ?? []).toList());
          }
        }

        List<LatLng>? polyLineCoordinates = [];
        for (int i = 0; i < steps.length; i++) {
          polyLineCoordinates.addAll(LatLngUtilHelper.decodeLatLng(
              steps[i].polyline?.encodedPolyline ?? ""));
        }

        emit(this.state.copyWith(
              polyLineCoordinates: polyLineCoordinates,
            ));
      },
    );
  }

  void _showTechnicalErrorMessage(BuildContext context) {
    return context.showSnackBar(
      MorphemeSnackBar.error(
        key: const ValueKey('snackbarError'),
        context: context,
        message: "Ada kesalahan teknis",
      ),
    );
  }

  void _getRouteAndSaveMarker(List<LatLng> optimizeLatLng) {
    OriginMapRoutes? origin = state.currentLocation?.latitude != null &&
            state.currentLocation?.longitude != null
        ? OriginMapRoutes(
            location: LocationMapRoutes(
              latLng: LatLngMapRoutes(
                latitude: state.currentLocation!.latitude,
                longitude: state.currentLocation!.longitude,
              ),
            ),
          )
        : null;

    OriginMapRoutes? destination;
    List<OriginMapRoutes> intermediates = [];

    for (int i = 0; i < optimizeLatLng.length; i++) {
      /// first location
      if (i == 0 && origin == null) {
        destination = OriginMapRoutes(
          location: LocationMapRoutes(
            latLng: LatLngMapRoutes(
              latitude: optimizeLatLng[i].latitude,
              longitude: optimizeLatLng[i].longitude,
            ),
          ),
        );
      }

      /// last location
      if (i == optimizeLatLng.length - 1) {
        destination = OriginMapRoutes(
          location: LocationMapRoutes(
            latLng: LatLngMapRoutes(
              latitude: optimizeLatLng[i].latitude,
              longitude: optimizeLatLng[i].longitude,
            ),
          ),
        );
      }
    }

    _fetchMapRoutes(
      MapRoutesBody(
        origin: origin,
        destination: destination,
        intermediates: intermediates,
      ),
    );

    /// ------------------------------------------------------------------------

    emit(state.copyWith(
      markerReportLatLng: optimizeLatLng,
    ));
  }

  void _fetchMapRoutes(MapRoutesBody body) =>
      mapRoutesBloc.add(FetchMapRoutes(body));

  void _getInitialCurrentLocation(BuildContext context) async {
    Location location = _getLatLngCurrentLocation();

    GoogleMapController googleMapController = await controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        emit(state.copyWith(
          currentLocation: newLoc,
        ));

        if (!isInitialCamera) {
          _moveMapCamera(googleMapController, newLoc);
          isInitialCamera = true;
        }
      },
    );

    _fetchMultipleRoute(context);
  }

  void _moveMapCamera(
    GoogleMapController googleMapController,
    LocationData newLoc,
  ) {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 13.5,
          target: LatLng(
            newLoc.latitude!,
            newLoc.longitude!,
          ),
        ),
      ),
    );
  }

  void updateCamera(LatLng latLng) async {
    (await controller.future).animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onZoomIn() async {
    if (state.currentLocation?.latitude != null &&
        state.currentLocation?.longitude != null) {
      double zoomValue = state.zoom + 1;
      (await controller.future).moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            state.currentLocation!.latitude!,
            state.currentLocation!.longitude!,
          ),
          zoom: zoomValue,
        )),
      );
      emit(state.copyWith(zoom: zoomValue));
    }
  }

  void onZoomOut() async {
    if (state.currentLocation?.latitude != null &&
        state.currentLocation?.longitude != null) {
      double zoomValue = state.zoom - 1;
      (await controller.future).moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            state.currentLocation!.latitude!,
            state.currentLocation!.longitude!,
          ),
          zoom: zoomValue,
        )),
      );
      emit(state.copyWith(zoom: zoomValue));
    }
  }

  void getCurrentLocation() {
    _getLatLngCurrentLocation();
    _moveToCurrentLocation();
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

  void _moveToCurrentLocation() async {
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(
        state.currentLocation?.latitude ?? 0.0,
        state.currentLocation?.longitude ?? 0.0,
      ),
      state.zoom,
    );
    (await controller.future).animateCamera(cameraUpdate);
  }

  void onCompassPressed() async {
    CameraPosition newPosition = CameraPosition(
      target: state.currentCameraPosition?.target ??
          LatLng(
            state.currentLocation?.latitude ?? 0.0,
            state.currentLocation?.longitude ?? 0.0,
          ),
      zoom: state.zoom,
      bearing: 0,
      tilt: 0,
    );
    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);
    (await controller.future).animateCamera(cameraUpdate);
  }

  void changeCameraPositionState(CameraPosition position) {
    emit(state.copyWith(
      currentCameraPosition: position,
    ));
  }

  void _fetchMultipleRoute(
    BuildContext context,
  ) {
    final List<LatLng>? markerReportLatLng = state.markerReportLatLng;

    if (markerReportLatLng != null) {
      _getRouteAndSaveMarker(
        markerReportLatLng,
      );
    }
  }

  // Function to calculate the distance between two points using the Haversine Formula
  double haversine(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Earth radius in kilometers

    double dLat = _degToRad(lat2 - lat1);
    double dLon = _degToRad(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) *
            cos(_degToRad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;

    return distance;
  }

  // Function to convert degrees to radians
  double _degToRad(double degree) {
    return degree * (pi / 180);
  }
}
