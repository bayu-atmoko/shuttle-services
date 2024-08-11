import 'package:core/core.dart';

import '../models/body/upload_file_body.dart';
import '../models/response/upload_file_response.dart';

abstract class UploadFileRemoteDataSource {
  Future<UploadFileResponse> uploadFile(
    UploadFileBody body, {
    Map<String, String>? headers,
  });
}

class UploadFileRemoteDataSourceImpl implements UploadFileRemoteDataSource {
  UploadFileRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<UploadFileResponse> uploadFile(
    UploadFileBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.postMultipart(
      MorphemeEndpoints.uploadFile,
      body: body.toMap().map((key, value) => MapEntry(key, value.toString())),
      files: body.files,
      headers: headers,
    );
    return UploadFileResponse.fromJson(response.body);
  }
}
