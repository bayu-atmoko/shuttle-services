part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}

class FetchProfile extends ProfileEvent {
  FetchProfile(this.body, {this.headers, this.extra});

  final ProfileBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
