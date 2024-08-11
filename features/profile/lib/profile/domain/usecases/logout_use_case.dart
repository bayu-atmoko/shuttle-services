import 'package:core/core.dart';

import '../../data/models/body/logout_body.dart';
import '../entities/logout_entity.dart';
import '../repositories/profile_repository.dart';

class LogoutUseCase implements UseCase<LogoutEntity, LogoutBody> {
  LogoutUseCase({
    required this.repository,
  });

  final ProfileRepository repository;

  @override
  Future<Either<MorphemeFailure, LogoutEntity>> call(
    LogoutBody body, {
    Map<String, String>? headers,
  }) {
    return repository.logout(body, headers: headers);
  }
}
