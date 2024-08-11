import 'package:core/core.dart';
import 'package:home/home/presentation/bloc/assigned_report/assigned_report_bloc.dart';
import 'package:home/home/presentation/bloc/cancel_report/cancel_report_bloc.dart';
import 'package:home/home/presentation/bloc/cleaned_report/cleaned_report_bloc.dart';
import 'package:home/home/presentation/bloc/finish_report/finish_report_bloc.dart';
import 'package:home/home/presentation/bloc/new_report/new_report_bloc.dart';

import 'data/datasources/home_remote_data_source.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/list_report_use_case.dart';
import 'presentation/cubit/home_cubit.dart';

void setupLocatorHome() {
  // *Cubit
  locator.registerFactory(() => HomeCubit(
        newReportBloc: locator(),
        assignedReportBloc: locator(),
        cleanedReportBloc: locator(),
        finishReportBloc: locator(),
        cancelReportBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => NewReportBloc(useCase: locator()));
  locator.registerFactory(() => AssignedReportBloc(useCase: locator()));
  locator.registerFactory(() => CleanedReportBloc(useCase: locator()));
  locator.registerFactory(() => FinishReportBloc(useCase: locator()));
  locator.registerFactory(() => CancelReportBloc(useCase: locator()));

  // *Usecase
  locator.registerLazySingleton(() => ListReportUseCase(repository: locator()));
  // *Repository
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(http: locator()),
  );
}
