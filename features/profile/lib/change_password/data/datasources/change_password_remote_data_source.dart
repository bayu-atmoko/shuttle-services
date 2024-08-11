import 'package:core/core.dart';

import '../models/body/change_password_body.dart';
import '../models/response/change_password_response.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordBody body, {
    Map<String, String>? headers,
  });
}

class ChangePasswordRemoteDataSourceImpl
    implements ChangePasswordRemoteDataSource {
  ChangePasswordRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      MorphemeEndpoints.changePassword,
      body: body.toMap(),
      headers: headers,
    );
    return ChangePasswordResponse.fromJson(response.body);
  }
}
