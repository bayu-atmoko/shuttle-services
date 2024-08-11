part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent extends Equatable {}

class FetchChangePassword extends ChangePasswordEvent {
  FetchChangePassword(this.body, {this.headers, this.extra});

  final ChangePasswordBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
