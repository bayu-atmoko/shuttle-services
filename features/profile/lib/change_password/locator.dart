import 'package:core/core.dart';

import 'data/datasources/change_password_remote_data_source.dart';
import 'data/repositories/change_password_repository_impl.dart';
import 'domain/repositories/change_password_repository.dart';
import 'domain/usecases/change_password_use_case.dart';
import 'presentation/bloc/change_password/change_password_bloc.dart';
import 'presentation/cubit/change_password_cubit.dart';

void setupLocatorChangePassword() {
  // *Cubit
  locator.registerFactory(() => ChangePasswordCubit(
        changePasswordBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => ChangePasswordBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(
      () => ChangePasswordUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<ChangePasswordRepository>(
    () => ChangePasswordRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<ChangePasswordRemoteDataSource>(
    () => ChangePasswordRemoteDataSourceImpl(http: locator()),
  );
}
