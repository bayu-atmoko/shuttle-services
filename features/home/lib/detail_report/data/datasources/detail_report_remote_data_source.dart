import 'package:core/core.dart';

import '../models/body/delete_report_body.dart';
import '../models/response/delete_report_response.dart';
import '../models/body/detail_report_body.dart';
import '../models/response/detail_report_response.dart';

abstract class DetailReportRemoteDataSource {
  Future<DeleteReportResponse> deleteReport(
    DeleteReportBody body, {
    Map<String, String>? headers,
  });
  Future<DetailReportResponse> detailReport(
    DetailReportBody body, {
    Map<String, String>? headers,
  });
}

class DetailReportRemoteDataSourceImpl implements DetailReportRemoteDataSource {
  DetailReportRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<DetailReportResponse> detailReport(
    DetailReportBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.detailReport(body.reportId),
      body: body.toMap(),
      headers: headers,
    );
    return DetailReportResponse.fromJson(response.body);
  }

  @override
  Future<DeleteReportResponse> deleteReport(
    DeleteReportBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(
      MorphemeEndpoints.deleteReport(body.reportId),
      body: body.toMap(),
      headers: headers,
    );
    return DeleteReportResponse.fromJson(response.body);
  }
}
