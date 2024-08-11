import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/delete_report_entity.dart';
import '../models/body/delete_report_body.dart';
import '../../domain/entities/detail_report_entity.dart';
import '../../domain/repositories/detail_report_repository.dart';
import '../datasources/detail_report_remote_data_source.dart';
import '../models/body/detail_report_body.dart';
import '../../mapper.dart';

class DetailReportRepositoryImpl implements DetailReportRepository {
  DetailReportRepositoryImpl({
    required this.remoteDataSource,
  });

  final DetailReportRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, DetailReportEntity>> detailReport(
    DetailReportBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.detailReport(body, headers: headers);
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

  @override
  Future<Either<MorphemeFailure, DeleteReportEntity>> deleteReport(
    DeleteReportBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.deleteReport(body, headers: headers);
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
