import 'package:core/core.dart';

import '../../data/models/body/profile_body.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class ProfileUseCase implements UseCase<ProfileEntity, ProfileBody> {
  ProfileUseCase({
    required this.repository,
  });

  final ProfileRepository repository;

  @override
  Future<Either<MorphemeFailure, ProfileEntity>> call(
    ProfileBody body, {
    Map<String, String>? headers,
  }) {
    return repository.profile(body, headers: headers);
  }
}
