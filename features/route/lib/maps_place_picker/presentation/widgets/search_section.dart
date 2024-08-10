import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/maps_place_picker/presentation/bloc/place_autocomplete/place_autocomplete_bloc.dart';
import 'package:route/maps_place_picker/presentation/cubit/google_maps_place_picker_cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final placeAutocompleteState = context.watch<PlaceAutocompleteBloc>().state;

    final autocompleteSearch = context.select(
        (MapsPlacePickerCubit element) => element.state.autocompleteSearch);

    return Padding(
      padding: const EdgeInsets.all(MorphemeSizes.s16),
      child: Column(
        children: [
          MorphemeTextField(
            key: const ValueKey("searchTextField"),
            onChanged: context.read<MapsPlacePickerCubit>().onSearchChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: context.color.primary,
              ),
              suffix: placeAutocompleteState is PlaceAutocompleteLoading
                  ? const SizedBox(
                      width: MorphemeSizes.s16,
                      height: MorphemeSizes.s16,
                      child: CircularProgressIndicator(),
                    )
                  : null,
              hintText: "Cari lokasi",
            ),
          ),
          if (autocompleteSearch.isNotEmpty) ...[
            const MorphemeSpacing.vertical8(),
            Container(
              decoration: BoxDecoration(
                color: context.color.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(MorphemeSizes.s8),
                ),
              ),
              child: MorphemeColumnSeparated(
                itemBuilder: (context, index) {
                  final place = autocompleteSearch[index];
                  return ListTile(
                    title: Text(place.description ?? ''),
                    onTap: () => context
                        .read<MapsPlacePickerCubit>()
                        .onAutocompleteSearchPressed(place),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(thickness: 1, height: 1),
                itemCount: autocompleteSearch.length,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
