import 'package:core/core.dart';

import 'domain/usecases/logout_use_case.dart';
import 'presentation/bloc/logout/logout_bloc.dart';
import 'data/datasources/profile_remote_data_source.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/usecases/profile_use_case.dart';
import 'presentation/bloc/profile/profile_bloc.dart';
import 'presentation/cubit/profile_cubit.dart';

void setupLocatorProfile() {
  // *Cubit
  locator.registerFactory(() => ProfileCubit(
        profileBloc: locator(),
        logoutBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => ProfileBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => ProfileUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(http: locator()),
  );
  // *Bloc
  locator.registerFactory(() => LogoutBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => LogoutUseCase(repository: locator()));
}
