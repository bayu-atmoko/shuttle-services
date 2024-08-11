part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileState extends Equatable {
  void when({
    void Function(EditProfileInitial state)? onInitial,
    void Function(EditProfileLoading state)? onLoading,
    void Function(EditProfileFailed state)? onFailed,
    void Function(EditProfileSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is EditProfileInitial) {
      onInitial?.call(state);
    } else if (state is EditProfileLoading) {
      onLoading?.call(state);
    } else if (state is EditProfileFailed) {
      onFailed?.call(state);
    } else if (state is EditProfileSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(EditProfileInitial state)? onInitial,
    Widget Function(EditProfileLoading state)? onLoading,
    Widget Function(EditProfileFailed state)? onFailed,
    Widget Function(EditProfileSuccess state)? onSuccess,
    Widget Function(EditProfileState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is EditProfileInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is EditProfileLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is EditProfileFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is EditProfileSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class EditProfileInitial extends EditProfileState {
  @override
  List<Object?> get props => [];
}

class EditProfileLoading extends EditProfileState {
  EditProfileLoading(this.body, this.headers, this.extra);

  final EditProfileBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class EditProfileSuccess extends EditProfileState {
  EditProfileSuccess(this.body, this.headers, this.data, this.extra);

  final EditProfileBody body;
  final Map<String, String>? headers;
  final EditProfileEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class EditProfileFailed extends EditProfileState {
  EditProfileFailed(this.body, this.headers, this.failure, this.extra);

  final EditProfileBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
