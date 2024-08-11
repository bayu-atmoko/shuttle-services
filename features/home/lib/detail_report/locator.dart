import 'package:core/core.dart';

import 'domain/usecases/delete_report_use_case.dart';
import 'presentation/bloc/delete_report/delete_report_bloc.dart';
import 'data/datasources/detail_report_remote_data_source.dart';
import 'data/repositories/detail_report_repository_impl.dart';
import 'domain/repositories/detail_report_repository.dart';
import 'domain/usecases/detail_report_use_case.dart';
import 'presentation/bloc/detail_report/detail_report_bloc.dart';
import 'presentation/cubit/detail_report_cubit.dart';

void setupLocatorDetailReport() {
  // *Cubit
  locator.registerFactory(() => DetailReportCubit(
        detailReportBloc: locator(),
        deleteReportBloc: locator(),
        editReportBloc: locator(),
        uploadFileBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => DetailReportBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => DetailReportUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<DetailReportRepository>(
    () => DetailReportRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<DetailReportRemoteDataSource>(
    () => DetailReportRemoteDataSourceImpl(http: locator()),
  );
  // *Bloc
  locator.registerFactory(() => DeleteReportBloc(useCase: locator()));

  // *Usecase
  locator
      .registerLazySingleton(() => DeleteReportUseCase(repository: locator()));
}
