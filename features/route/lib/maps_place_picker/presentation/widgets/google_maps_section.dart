import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/maps_place_picker/presentation/cubit/google_maps_place_picker_cubit.dart';

class GoogleMapsSection extends StatelessWidget {
  const GoogleMapsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final latLng =
        context.select((MapsPlacePickerCubit element) => element.state).latLng;
    final initialLatLng = context
        .select((MapsPlacePickerCubit element) => element.state)
        .initialLatLng;

    return GoogleMap(
      zoomControlsEnabled: false,
      markers: <Marker>{}..add(
          Marker(
            markerId: const MarkerId('merchantLocation'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: latLng ?? initialLatLng,
          ),
        ),
      initialCameraPosition: CameraPosition(
        target: latLng ?? initialLatLng,
        zoom: 14.4746,
      ),
      onMapCreated: context.read<MapsPlacePickerCubit>().onMapsCreated,
      onTap: (LatLng location) =>
          context.read<MapsPlacePickerCubit>().onMapTap(context, location),
    );
  }
}
