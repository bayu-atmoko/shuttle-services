import 'package:core/core.dart';

import 'domain/usecases/create_report_use_case.dart';
import 'presentation/bloc/create_report/create_report_bloc.dart';
import 'data/datasources/create_report_remote_data_source.dart';
import 'data/repositories/create_report_repository_impl.dart';
import 'domain/repositories/create_report_repository.dart';
import 'domain/usecases/complaint_use_case.dart';
import 'presentation/bloc/complaint/complaint_bloc.dart';
import 'presentation/cubit/create_report_cubit.dart';

void setupLocatorCreateReport() {
  // *Cubit
  locator.registerFactory(() => CreateReportCubit(
        createReportBloc: locator(),
        uploadFileBloc: locator(),
        complaintBloc: locator(),
        editReportBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => ComplaintBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => ComplaintUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<CreateReportRepository>(
    () => CreateReportRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<CreateReportRemoteDataSource>(
    () => CreateReportRemoteDataSourceImpl(http: locator()),
  );
  // *Bloc
  locator.registerFactory(() => CreateReportBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => CreateReportUseCase(repository: locator()));
}
