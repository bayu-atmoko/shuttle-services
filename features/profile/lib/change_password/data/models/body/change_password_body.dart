import 'package:core/core.dart';

class ChangePasswordBody extends Equatable {
  const ChangePasswordBody({
    this.oldPassword,
    this.newPassword,
  });

  final String? oldPassword;
  final String? newPassword;

  Map<String, dynamic> toMap() {
    return {
      if (oldPassword != null) 'old_password': oldPassword,
      if (newPassword != null) 'new_password': newPassword,
    };
  }

  @override
  List<Object?> get props => [
        oldPassword,
        newPassword,
      ];
}
