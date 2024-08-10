import 'package:core/core.dart';
import 'package:route/map/domain/usecases/distance_matrix_use_case.dart';
import 'package:route/map/presentation/bloc/distance_matrix/distance_matrix_bloc.dart';

import 'data/datasources/map_remote_data_source.dart';
import 'data/repositories/map_repository_impl.dart';
import 'domain/repositories/map_repository.dart';
import 'domain/usecases/map_routes_use_case.dart';
import 'presentation/bloc/map_routes/map_routes_bloc.dart';
import 'presentation/cubit/map_cubit.dart';

void setupLocatorMap() {
  // *Cubit
  locator.registerFactory(() => MapCubit(
        mapRoutesBloc: locator(),
      ));

  // *Bloc
  locator.registerFactory(() => MapRoutesBloc(useCase: locator()));

  locator.registerFactory(() => DistanceMatrixBloc(useCase: locator()));
  // *Use case
  locator.registerLazySingleton(() => MapRoutesUseCase(repository: locator()));

  locator.registerLazySingleton(
      () => DistanceMatrixUseCase(repository: locator()));

  // *Repository
  locator.registerLazySingleton<MapRepository>(
    () => MapRepositoryImpl(remoteDataSource: locator()),
  );

  // *Data source
  locator.registerLazySingleton<MapRemoteDataSource>(
    () => MapRemoteDataSourceImpl(
      http: MorphemeHttp(
        timeout: 30000,
        // TODO isNotProd
        showLog: true,
        morphemeInspector: locator(),
        // showLog: Environment.isNotProd,
        // morphemeInspector: Environment.isNotProd ? locator() : null,
      ),
    ),
  );
}
