import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../pages/detail_maps_page.dart';

part 'detail_maps_state.dart';

class DetailMapsCubit extends MorphemeCubit<DetailMapsStateCubit> {
  DetailMapsCubit() : super(const DetailMapsStateCubit());

  final Completer<GoogleMapController> mapsCompleter = Completer();
  GoogleMapController? mapsController;

  @override
  void initArgument<Page>(BuildContext context, Page widget) async {
    super.initArgument(context, widget);
    if (widget is! DetailMapsPage) return;

    final initialLocation = widget.locationLatLng;
    if (initialLocation?.latitude != null &&
        initialLocation?.longitude != null) {
      final latLng = LatLng(
        initialLocation!.latitude,
        initialLocation.longitude,
      );
      emit(state.copyWith(
        latLng: latLng,
      ));
    }
  }

  void initLocation() async {
    if (mounted && state.latLng != null) {
      state.latLng?.run((it) => updateCamera(it));
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
  }

  void updateCamera(LatLng latLng) async {
    if (mapsController == null) return;
    mapsController!.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}
