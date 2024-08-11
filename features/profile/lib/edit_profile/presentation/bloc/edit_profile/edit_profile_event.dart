part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent extends Equatable {}

class FetchEditProfile extends EditProfileEvent {
  FetchEditProfile(this.body, {this.headers, this.extra});

  final EditProfileBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
