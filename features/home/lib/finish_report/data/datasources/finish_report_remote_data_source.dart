import 'package:core/core.dart';

import '../models/body/edit_report_body.dart';
import '../models/response/edit_report_response.dart';

abstract class FinishReportRemoteDataSource {
  Future<EditReportResponse> editReport(
    EditReportBody body, {
    Map<String, String>? headers,
  });
}

class FinishReportRemoteDataSourceImpl implements FinishReportRemoteDataSource {
  FinishReportRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<EditReportResponse> editReport(
    EditReportBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      MorphemeEndpoints.editReport(body.reportId),
      body: body.toMap(),
      headers: headers,
    );
    return EditReportResponse.fromJson(response.body);
  }
}
