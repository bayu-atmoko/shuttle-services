part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState extends Equatable {
  void when({
    void Function(ChangePasswordInitial state)? onInitial,
    void Function(ChangePasswordLoading state)? onLoading,
    void Function(ChangePasswordFailed state)? onFailed,
    void Function(ChangePasswordSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is ChangePasswordInitial) {
      onInitial?.call(state);
    } else if (state is ChangePasswordLoading) {
      onLoading?.call(state);
    } else if (state is ChangePasswordFailed) {
      onFailed?.call(state);
    } else if (state is ChangePasswordSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(ChangePasswordInitial state)? onInitial,
    Widget Function(ChangePasswordLoading state)? onLoading,
    Widget Function(ChangePasswordFailed state)? onFailed,
    Widget Function(ChangePasswordSuccess state)? onSuccess,
    Widget Function(ChangePasswordState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ChangePasswordInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ChangePasswordLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ChangePasswordFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ChangePasswordSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ChangePasswordInitial extends ChangePasswordState {
  @override
  List<Object?> get props => [];
}

class ChangePasswordLoading extends ChangePasswordState {
  ChangePasswordLoading(this.body, this.headers, this.extra);

  final ChangePasswordBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class ChangePasswordSuccess extends ChangePasswordState {
  ChangePasswordSuccess(this.body, this.headers, this.data, this.extra);

  final ChangePasswordBody body;
  final Map<String, String>? headers;
  final ChangePasswordEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class ChangePasswordFailed extends ChangePasswordState {
  ChangePasswordFailed(this.body, this.headers, this.failure, this.extra);

  final ChangePasswordBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
