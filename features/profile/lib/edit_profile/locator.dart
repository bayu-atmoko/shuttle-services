import 'package:core/core.dart';

import 'data/datasources/edit_profile_remote_data_source.dart';
import 'data/repositories/edit_profile_repository_impl.dart';
import 'domain/repositories/edit_profile_repository.dart';
import 'domain/usecases/edit_profile_use_case.dart';
import 'presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'presentation/cubit/edit_profile_cubit.dart';

void setupLocatorEditProfile() {
  // *Cubit
  locator.registerFactory(() => EditProfileCubit(
        editProfileBloc: locator(),
        uploadFileBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => EditProfileBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => EditProfileUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<EditProfileRepository>(
    () => EditProfileRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<EditProfileRemoteDataSource>(
    () => EditProfileRemoteDataSourceImpl(http: locator()),
  );
}
