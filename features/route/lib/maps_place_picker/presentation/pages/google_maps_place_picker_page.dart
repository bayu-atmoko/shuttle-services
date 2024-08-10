// import 'package:calculation/emission_calculation/domain/entities/location_entity.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/map/presentation/widgets/maps_button.dart';
import 'package:route/maps_place_picker/presentation/cubit/google_maps_place_picker_cubit.dart';

import '../widgets/widgets.dart';

class MapsPlacePickerPage extends StatefulWidget {
  const MapsPlacePickerPage({
    super.key,
    required this.pageParams,
  });

  final ExtraPlacePicker? pageParams;

  @override
  State<MapsPlacePickerPage> createState() => _MapsPlacePickerPageState();
}

class _MapsPlacePickerPageState extends State<MapsPlacePickerPage>
    with MorphemeStatePage<MapsPlacePickerPage, MapsPlacePickerCubit> {
  @override
  MapsPlacePickerCubit setCubit() => locator<MapsPlacePickerCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final isLoading = context
        .select((MapsPlacePickerCubit element) => element.state)
        .isLoading;

    return MorphemeScrollViewWithAppBar(
      tittle: "   Pilih lokasi penjemputan",
      isScroll: false,
      child: Stack(
        children: [
          const GoogleMapsSection(),

          /// my location button
          Positioned(
            bottom: MorphemeSizes.marginPage + MorphemeSizes.s65,
            right: MorphemeSizes.marginPage,
            child: Column(
              children: [
                MapsButton(
                  icon: Icons.my_location,
                  onTap: () =>
                      context.read<MapsPlacePickerCubit>().getCurrentLocation(),
                ),
              ],
            ),
          ),

          /// search textfield
          Builder(builder: (context) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SearchSection();
          }),

          /// select button
          const SelectButtonSection(),
        ],
      ),
    );
  }
}
