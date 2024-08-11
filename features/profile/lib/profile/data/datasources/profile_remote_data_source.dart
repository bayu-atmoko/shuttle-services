import 'package:core/core.dart';

import '../models/body/logout_body.dart';
import '../models/response/logout_response.dart';
import '../models/body/profile_body.dart';
import '../models/response/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<LogoutResponse> logout(
    LogoutBody body, {
    Map<String, String>? headers,
  });
  Future<ProfileResponse> profile(
    ProfileBody body, {
    Map<String, String>? headers,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ProfileResponse> profile(
    ProfileBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.profile,
      body: body.toMap(),
      headers: headers,
    );
    return ProfileResponse.fromJson(response.body);
  }

  @override
  Future<LogoutResponse> logout(
    LogoutBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.logout,
      body: body.toMap(),
      headers: headers,
    );
    return LogoutResponse.fromJson(response.body);
  }
}
