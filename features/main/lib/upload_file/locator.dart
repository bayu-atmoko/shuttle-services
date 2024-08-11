import 'package:core/core.dart';

import 'data/datasources/upload_file_remote_data_source.dart';
import 'data/repositories/upload_file_repository_impl.dart';
import 'domain/repositories/upload_file_repository.dart';
import 'domain/usecases/upload_file_use_case.dart';
import 'presentation/bloc/upload_file/upload_file_bloc.dart';
import 'presentation/cubit/upload_file_cubit.dart';

void setupLocatorUploadFile() {
  // *Cubit
  locator.registerFactory(() => UploadFileCubit());
  // *Bloc
  locator.registerFactory(() => UploadFileBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => UploadFileUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<UploadFileRepository>(
    () => UploadFileRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<UploadFileRemoteDataSource>(
    () => UploadFileRemoteDataSourceImpl(http: locator()),
  );
}
