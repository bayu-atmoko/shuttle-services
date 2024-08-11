import 'package:core/core.dart';

import '../../data/models/body/change_password_body.dart';
import '../entities/change_password_entity.dart';

abstract class ChangePasswordRepository {
  Future<Either<MorphemeFailure, ChangePasswordEntity>> changePassword(
    ChangePasswordBody body, {
    Map<String, String>? headers,
  });
}
