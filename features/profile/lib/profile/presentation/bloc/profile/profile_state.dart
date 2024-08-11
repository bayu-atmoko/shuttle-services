part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  void when({
    void Function(ProfileInitial state)? onInitial,
    void Function(ProfileLoading state)? onLoading,
    void Function(ProfileFailed state)? onFailed,
    void Function(ProfileSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is ProfileInitial) {
      onInitial?.call(state);
    } else if (state is ProfileLoading) {
      onLoading?.call(state);
    } else if (state is ProfileFailed) {
      onFailed?.call(state);
    } else if (state is ProfileSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(ProfileInitial state)? onInitial,
    Widget Function(ProfileLoading state)? onLoading,
    Widget Function(ProfileFailed state)? onFailed,
    Widget Function(ProfileSuccess state)? onSuccess,
    Widget Function(ProfileState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ProfileInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ProfileLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ProfileFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ProfileSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {
  ProfileLoading(this.body, this.headers, this.extra);

  final ProfileBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class ProfileSuccess extends ProfileState {
  ProfileSuccess(this.body, this.headers, this.data, this.extra);

  final ProfileBody body;
  final Map<String, String>? headers;
  final ProfileEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class ProfileFailed extends ProfileState {
  ProfileFailed(this.body, this.headers, this.failure, this.extra);

  final ProfileBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
