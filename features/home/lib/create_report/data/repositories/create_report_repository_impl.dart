import 'package:core/core.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

import '../../domain/entities/create_report_entity.dart';
import '../models/body/create_report_body.dart';
import '../../domain/entities/complaint_entity.dart';
import '../../domain/repositories/create_report_repository.dart';
import '../datasources/create_report_remote_data_source.dart';
import '../models/body/complaint_body.dart';
import '../../mapper.dart';

class CreateReportRepositoryImpl implements CreateReportRepository {
  CreateReportRepositoryImpl({
    required this.remoteDataSource,
  });

  final CreateReportRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, ComplaintEntity>> complaint(
    ComplaintBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.complaint(body, headers: headers);
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
  Future<Either<MorphemeFailure, CreateReportEntity>> createReport(
    CreateReportBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.createReport(body, headers: headers);
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
