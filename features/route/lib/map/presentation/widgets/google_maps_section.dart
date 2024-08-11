import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:route/map/presentation/cubit/map_cubit.dart';

class GoogleMapsSection extends StatefulWidget {
  const GoogleMapsSection({super.key});

  @override
  State<GoogleMapsSection> createState() => GoogleMapsSectionState();
}

class GoogleMapsSectionState extends State<GoogleMapsSection> {
  @override
  Widget build(BuildContext context) {
    final List<LatLng> polyLineCoordinates =
        context.select((MapCubit element) => element.state).polyLineCoordinates;
    final LocationData? currentLocation =
        context.select((MapCubit element) => element.state).currentLocation;
    final List<LatLng> markerReportLatLng = context
            .select((MapCubit element) => element.state)
            .markerReportLatLng ??
        [];
    final zoom = context.select((MapCubit element) => element.state).zoom;

    Set<Marker> markersList = {};

    /// current location
    if (currentLocation?.latitude != null &&
        currentLocation?.longitude != null) {
      markersList.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueCyan,
          ),
          position: LatLng(
            currentLocation!.latitude!,
            currentLocation.longitude!,
          ),
          infoWindow: InfoWindow(
            title: context.s.currentLocation,
          ),
        ),
      );
    }

    /// route location
    markerReportLatLng.forEachIndexed((index, element) {
      markersList.add(
        Marker(
          markerId: MarkerId("location_$index"),
          position: LatLng(
            element.latitude,
            element.longitude,
          ),
          infoWindow: InfoWindow(
            title: '${context.s.report} ${index + 1}',
          ),
        ),
      );
    });

    return Scaffold(
      body: currentLocation == null
          ? Container(
              color: context.color.grey2,
              alignment: Alignment.center,
              child: MorphemeText.titleSmall(
                context.s.enableDeviceLocation,
                textAlign: TextAlign.center,
              ),
            )
          : GoogleMap(
              onCameraMove: (CameraPosition position) =>
                  context.read<MapCubit>().changeCameraPositionState(position),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation.latitude!,
                  currentLocation.longitude!,
                ),
                zoom: zoom,
              ),
              markers: markersList,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) =>
                  context.read<MapCubit>().controller.complete(controller),
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polyLineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
    );
  }
}
