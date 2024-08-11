import 'package:core/core.dart';

import 'domain/usecases/route_optimization_use_case.dart';
import 'presentation/bloc/route_optimization/route_optimization_bloc.dart';

import 'domain/usecases/update_route_use_case.dart';
import 'presentation/bloc/update_route/update_route_bloc.dart';
import 'data/datasources/route_recommendation_remote_data_source.dart';
import 'data/repositories/route_recommendation_repository_impl.dart';
import 'domain/repositories/route_recommendation_repository.dart';
import 'domain/usecases/create_route_use_case.dart';
import 'presentation/bloc/create_route/create_route_bloc.dart';

void setupLocatorRouteRecommendation() {
  // *Bloc
  locator.registerFactory(() => CreateRouteBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => CreateRouteUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<RouteRecommendationRepository>(
    () => RouteRecommendationRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<RouteRecommendationRemoteDataSource>(
    () => RouteRecommendationRemoteDataSourceImpl(http: locator()),
  );
  // *Bloc
  locator.registerFactory(() => UpdateRouteBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => UpdateRouteUseCase(repository: locator()));

  // *Bloc
  locator.registerFactory(() => RouteOptimizationBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(
      () => RouteOptimizationUseCase(repository: locator()));
}
