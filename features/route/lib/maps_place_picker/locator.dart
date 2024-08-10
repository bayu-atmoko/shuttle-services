import 'package:core/core.dart';
import 'package:route/maps_place_picker/data/datasources/google_maps_place_picker_remote_data_source.dart';
import 'package:route/maps_place_picker/data/repositories/google_maps_place_picker_repository_impl.dart';
import 'package:route/maps_place_picker/domain/repositories/google_maps_place_picker_repository.dart';
import 'package:route/maps_place_picker/presentation/cubit/google_maps_place_picker_cubit.dart';

import 'domain/usecases/direction_use_case.dart';
import 'presentation/bloc/direction/direction_bloc.dart';

import 'domain/usecases/geocoding_use_case.dart';
import 'presentation/bloc/geocoding/geocoding_bloc.dart';
import 'domain/usecases/place_autocomplete_use_case.dart';
import 'presentation/bloc/place_autocomplete/place_autocomplete_bloc.dart';

void setupLocatorMapsPlacePicker() {
  // *Cubit
  locator.registerFactory(() => MapsPlacePickerCubit(
      directionBloc: locator(),
      geocodingBloc: locator(),
      placeAutocompleteBloc: locator()));
  // *Bloc
  locator.registerFactory(() => PlaceAutocompleteBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(
      () => PlaceAutocompleteUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<MapsPlacePickerRepository>(
    () => MapsPlacePickerRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<MapsPlacePickerRemoteDataSource>(
    () => MapsPlacePickerRemoteDataSourceImpl(http: locator()),
  );
  // *Bloc
  locator.registerFactory(() => GeocodingBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => GeocodingUseCase(repository: locator()));

  // *Bloc
  locator.registerFactory(() => DirectionBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => DirectionUseCase(repository: locator()));
}
