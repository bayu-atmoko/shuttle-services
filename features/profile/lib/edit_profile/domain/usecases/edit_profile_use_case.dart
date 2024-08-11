import 'package:core/core.dart';

import '../../data/models/body/edit_profile_body.dart';
import '../entities/edit_profile_entity.dart';
import '../repositories/edit_profile_repository.dart';

class EditProfileUseCase
    implements UseCase<EditProfileEntity, EditProfileBody> {
  EditProfileUseCase({
    required this.repository,
  });

  final EditProfileRepository repository;

  @override
  Future<Either<MorphemeFailure, EditProfileEntity>> call(
    EditProfileBody body, {
    Map<String, String>? headers,
  }) {
    return repository.editProfile(body, headers: headers);
  }
}
