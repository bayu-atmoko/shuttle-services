import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/detail_maps_cubit.dart';

class DetailMapsPage extends StatefulWidget {
  const DetailMapsPage({
    super.key,
    required this.locationLatLng,
  });

  final LatLng? locationLatLng;

  @override
  State<DetailMapsPage> createState() => _DetailMapsPageState();
}

class _DetailMapsPageState extends State<DetailMapsPage>
    with MorphemeStatePage<DetailMapsPage, DetailMapsCubit> {
  @override
  DetailMapsCubit setCubit() => locator<DetailMapsCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final latLng =
        context.select((DetailMapsCubit element) => element.state).latLng;

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.coordinatePointOfReport,
      isScroll: false,
      child: latLng != null
          ? GoogleMap(
              zoomControlsEnabled: false,
              markers: <Marker>{}..add(
                  Marker(
                    markerId: const MarkerId('merchantLocation'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                    position: latLng,
                  ),
                ),
              initialCameraPosition: CameraPosition(
                target: latLng,
                zoom: 14.4746,
              ),
              onMapCreated: context.read<DetailMapsCubit>().onMapsCreated,
            )
          : Container(
              color: context.color.grey2,
              alignment: Alignment.center,
              child: MorphemeText.titleSmall(
                context.s.reportDoesNotHaveCoordinatePoint,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
