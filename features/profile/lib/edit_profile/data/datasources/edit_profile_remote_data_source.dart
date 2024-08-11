import 'package:core/core.dart';

import '../models/body/edit_profile_body.dart';
import '../models/response/edit_profile_response.dart';

abstract class EditProfileRemoteDataSource {
  Future<EditProfileResponse> editProfile(
    EditProfileBody body, {
    Map<String, String>? headers,
  });
}

class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  EditProfileRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<EditProfileResponse> editProfile(
    EditProfileBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      MorphemeEndpoints.editProfile,
      body: body.toMap(),
      headers: headers,
    );
    return EditProfileResponse.fromJson(response.body);
  }
}
