import 'package:core/core.dart';

import '../../data/models/body/edit_profile_body.dart';
import '../entities/edit_profile_entity.dart';

abstract class EditProfileRepository {
  Future<Either<MorphemeFailure, EditProfileEntity>> editProfile(
    EditProfileBody body, {
    Map<String, String>? headers,
  });
}
