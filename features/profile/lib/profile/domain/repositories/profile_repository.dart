import 'package:core/core.dart';

import '../../data/models/body/logout_body.dart';
import '../entities/logout_entity.dart';
import '../../data/models/body/profile_body.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<MorphemeFailure, ProfileEntity>> profile(
    ProfileBody body, {
    Map<String, String>? headers,
  });
  Future<Either<MorphemeFailure, LogoutEntity>> logout(
    LogoutBody body, {
    Map<String, String>? headers,
  });
}
