import 'package:core/core.dart';

import '../models/body/create_report_body.dart';
import '../models/response/create_report_response.dart';
import '../models/body/complaint_body.dart';
import '../models/response/complaint_response.dart';

abstract class CreateReportRemoteDataSource {
  Future<CreateReportResponse> createReport(
    CreateReportBody body, {
    Map<String, String>? headers,
  });
  Future<ComplaintResponse> complaint(
    ComplaintBody body, {
    Map<String, String>? headers,
  });
}

class CreateReportRemoteDataSourceImpl implements CreateReportRemoteDataSource {
  CreateReportRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ComplaintResponse> complaint(
    ComplaintBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.complaint,
      body: body.toMap(),
      headers: headers,
    );
    return ComplaintResponse.fromJson(response.body);
  }

  @override
  Future<CreateReportResponse> createReport(
    CreateReportBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.createReport,
      body: body.toMap(),
      headers: headers,
    );
    return CreateReportResponse.fromJson(response.body);
  }
}
