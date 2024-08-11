part of 'create_route_bloc.dart';

@immutable
abstract class CreateRouteState extends Equatable {
  void when({
    void Function(CreateRouteInitial state)? onInitial,
    void Function(CreateRouteLoading state)? onLoading,
    void Function(CreateRouteFailed state)? onFailed,
    void Function(CreateRouteSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is CreateRouteInitial) {
      onInitial?.call(state);
    } else if (state is CreateRouteLoading) {
      onLoading?.call(state);
    } else if (state is CreateRouteFailed) {
      onFailed?.call(state);
    } else if (state is CreateRouteSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(CreateRouteInitial state)? onInitial,
    Widget Function(CreateRouteLoading state)? onLoading,
    Widget Function(CreateRouteFailed state)? onFailed,
    Widget Function(CreateRouteSuccess state)? onSuccess,
    Widget Function(CreateRouteState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is CreateRouteInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is CreateRouteLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is CreateRouteFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is CreateRouteSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class CreateRouteInitial extends CreateRouteState {
  @override
  List<Object?> get props => [];
}

class CreateRouteLoading extends CreateRouteState {
  CreateRouteLoading(this.body, this.headers, this.extra);

  final CreateRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class CreateRouteSuccess extends CreateRouteState {
  CreateRouteSuccess(this.body, this.headers, this.data, this.extra);

  final CreateRouteBody body;
  final Map<String, String>? headers;
  final CreateRouteEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class CreateRouteFailed extends CreateRouteState {
  CreateRouteFailed(this.body, this.headers, this.failure, this.extra);

  final CreateRouteBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
