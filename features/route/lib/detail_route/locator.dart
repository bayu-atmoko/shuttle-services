import 'package:core/core.dart';

import 'data/datasources/detail_route_remote_data_source.dart';
import 'data/repositories/detail_route_repository_impl.dart';
import 'domain/repositories/detail_route_repository.dart';
import 'domain/usecases/detail_route_use_case.dart';
import 'presentation/bloc/detail_route/detail_route_bloc.dart';
import 'presentation/cubit/detail_route_cubit.dart';

void setupLocatorDetailRoute() {
  // *Cubit
  locator.registerFactory(() => DetailRouteCubit(
        detailRouteBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => DetailRouteBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => DetailRouteUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<DetailRouteRepository>(
    () => DetailRouteRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<DetailRouteRemoteDataSource>(
    () => DetailRouteRemoteDataSourceImpl(http: locator()),
  );
}
