import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/edit_report_entity.dart';
import '../../domain/repositories/finish_report_repository.dart';
import '../datasources/finish_report_remote_data_source.dart';
import '../models/body/edit_report_body.dart';
import '../../mapper.dart';

class FinishReportRepositoryImpl implements FinishReportRepository {
  FinishReportRepositoryImpl({
    required this.remoteDataSource,
  });

  final FinishReportRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, EditReportEntity>> editReport(
    EditReportBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.editReport(body, headers: headers);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      if (e.statusCode == 500) {
        locator<ExpiredTokenRepository>().moveToExpiredTokenPage();
      }
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
