import 'package:core/core.dart';

import 'data/datasources/finish_report_remote_data_source.dart';
import 'data/repositories/finish_report_repository_impl.dart';
import 'domain/repositories/finish_report_repository.dart';
import 'domain/usecases/edit_report_use_case.dart';
import 'presentation/bloc/edit_report/edit_report_bloc.dart';

void setupLocatorFinishReport() {
  // *Bloc
  locator.registerFactory(() => EditReportBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => EditReportUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<FinishReportRepository>(
    () => FinishReportRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<FinishReportRemoteDataSource>(
    () => FinishReportRemoteDataSourceImpl(http: locator()),
  );
}
