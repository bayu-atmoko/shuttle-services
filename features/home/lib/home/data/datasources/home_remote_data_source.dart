import 'package:core/core.dart';

import '../models/body/list_report_body.dart';
import '../models/response/list_report_response.dart';

abstract class HomeRemoteDataSource {
  Future<ListReportResponse> listReport(
    ListReportBody body, {
    Map<String, String>? headers,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ListReportResponse> listReport(
    ListReportBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.listReport(
        body.page.toString(),
        body.perPage.toString(),
        body.status,
        body.search,
        body.sort,
        body.sortType,
        body.startDate != null ? body.startDate.toString() : '',
        body.endDate != null ? body.endDate.toString() : '',
      ),
      body: body.toMap(),
      headers: headers,
    );
    return ListReportResponse.fromJson(response.body);
  }
}
