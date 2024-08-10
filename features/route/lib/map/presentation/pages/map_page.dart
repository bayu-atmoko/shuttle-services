import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/map/presentation/widgets/google_maps_section.dart';
import 'package:route/map/presentation/widgets/maps_button.dart';

import '../cubit/map_cubit.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    required this.pageParams,
  });

  final ExtraPlacePicker? pageParams;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with MorphemeStatePage<MapPage, MapCubit> {
  @override
  MapCubit setCubit() => locator<MapCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return MorphemeScrollViewWithAppBar(
      tittle: "Rute Perjalanan",
      titleSpacing: MorphemeSizes.s16,
      isScroll: false,
      child: Stack(
        children: [
          const GoogleMapsSection(),

          /// right button
          Positioned(
            bottom: MorphemeSizes.marginPage,
            right: MorphemeSizes.marginPage,
            child: Column(
              children: [
                MapsButton(
                  icon: Icons.my_location,
                  onTap: () => context.read<MapCubit>().getCurrentLocation(),
                ),
                const MorphemeSpacing.vertical8(),
                MapsButton(
                  icon: Icons.explore_outlined,
                  onTap: () => context.read<MapCubit>().onCompassPressed(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
