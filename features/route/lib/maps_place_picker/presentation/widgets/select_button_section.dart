import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/maps_place_picker/presentation/cubit/google_maps_place_picker_cubit.dart';

class SelectButtonSection extends StatelessWidget {
  const SelectButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final latLng =
        context.select((MapsPlacePickerCubit element) => element.state).latLng;

    return Positioned(
      left: MorphemeSizes.s16,
      right: MorphemeSizes.s16,
      bottom: MorphemeSizes.s16,
      child: MorphemeButton.elevated(
        key: const ValueKey("selectLocationButton"),
        text: "Pilih lokasi",
        onPressed: () {
          if (latLng == null) {
            context.showSnackBar(
              MorphemeSnackBar.error(
                key: const ValueKey('snackbarError'),
                context: context,
                message: "Kamu belum memilih lokasi di maps",
              ),
            );
          } else {
            context
                .read<MapsPlacePickerCubit>()
                .onSelectLocationPointPressed(context);
          }
        },
      ),
    );
  }
}
