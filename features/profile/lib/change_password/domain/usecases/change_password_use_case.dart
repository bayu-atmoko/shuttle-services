import 'package:core/core.dart';

import '../../data/models/body/change_password_body.dart';
import '../entities/change_password_entity.dart';
import '../repositories/change_password_repository.dart';

class ChangePasswordUseCase
    implements UseCase<ChangePasswordEntity, ChangePasswordBody> {
  ChangePasswordUseCase({
    required this.repository,
  });

  final ChangePasswordRepository repository;

  @override
  Future<Either<MorphemeFailure, ChangePasswordEntity>> call(
    ChangePasswordBody body, {
    Map<String, String>? headers,
  }) {
    return repository.changePassword(body, headers: headers);
  }
}
