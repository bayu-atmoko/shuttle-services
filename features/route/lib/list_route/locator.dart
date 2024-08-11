import 'package:core/core.dart';

import 'data/datasources/list_route_remote_data_source.dart';
import 'data/repositories/list_route_repository_impl.dart';
import 'domain/repositories/list_route_repository.dart';
import 'domain/usecases/list_route_use_case.dart';
import 'presentation/bloc/list_route/list_route_bloc.dart';

void setupLocatorListRoute() {
  // *Bloc
  locator.registerFactory(() => ListRouteBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => ListRouteUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<ListRouteRepository>(
    () => ListRouteRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<ListRouteRemoteDataSource>(
    () => ListRouteRemoteDataSourceImpl(http: locator()),
  );
}
