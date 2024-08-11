part of 'complaint_bloc.dart';

@immutable
abstract class ComplaintState extends Equatable {
  void when({
    void Function(ComplaintInitial state)? onInitial,
    void Function(ComplaintLoading state)? onLoading,
    void Function(ComplaintFailed state)? onFailed,
    void Function(ComplaintSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is ComplaintInitial) {
      onInitial?.call(state);
    } else if (state is ComplaintLoading) {
      onLoading?.call(state);
    } else if (state is ComplaintFailed) {
      onFailed?.call(state);
    } else if (state is ComplaintSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(ComplaintInitial state)? onInitial,
    Widget Function(ComplaintLoading state)? onLoading,
    Widget Function(ComplaintFailed state)? onFailed,
    Widget Function(ComplaintSuccess state)? onSuccess,
    Widget Function(ComplaintState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ComplaintInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ComplaintLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ComplaintFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ComplaintSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ComplaintInitial extends ComplaintState {
  @override
  List<Object?> get props => [];
}

class ComplaintLoading extends ComplaintState {
  ComplaintLoading(this.body, this.headers, this.extra);

  final ComplaintBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class ComplaintSuccess extends ComplaintState {
  ComplaintSuccess(this.body, this.headers, this.data, this.extra);

  final ComplaintBody body;
  final Map<String, String>? headers;
  final ComplaintEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class ComplaintFailed extends ComplaintState {
  ComplaintFailed(this.body, this.headers, this.failure, this.extra);

  final ComplaintBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
