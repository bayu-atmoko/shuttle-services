import 'package:core/core.dart';

class LogoutEntity extends Equatable {
  const LogoutEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
