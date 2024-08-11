part of 'update_route_bloc.dart';

@immutable
abstract class UpdateRouteState extends Equatable {
  void when({
    void Function(UpdateRouteInitial state)? onInitial,
    void Function(UpdateRouteLoading state)? onLoading,
    void Function(UpdateRouteFailed state)? onFailed,
    void Function(UpdateRouteSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is UpdateRouteInitial) {
      onInitial?.call(state);
    } else if (state is UpdateRouteLoading) {
      onLoading?.call(state);
    } else if (state is UpdateRouteFailed) {
      onFailed?.call(state);
    } else if (state is UpdateRouteSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(UpdateRouteInitial state)? onInitial,
    Widget Function(UpdateRouteLoading state)? onLoading,
    Widget Function(UpdateRouteFailed state)? onFailed,
    Widget Function(UpdateRouteSuccess state)? onSuccess,
    Widget Function(UpdateRouteState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is UpdateRouteInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is UpdateRouteLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is UpdateRouteFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is UpdateRouteSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class UpdateRouteInitial extends UpdateRouteState {
  @override
  List<Object?> get props => [];
}

class UpdateRouteLoading extends UpdateRouteState {
  UpdateRouteLoading(this.body, this.headers, this.extra);

  final UpdateRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class UpdateRouteSuccess extends UpdateRouteState {
  UpdateRouteSuccess(this.body, this.headers, this.data, this.extra);

  final UpdateRouteBody body;
  final Map<String, String>? headers;
  final UpdateRouteEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class UpdateRouteFailed extends UpdateRouteState {
  UpdateRouteFailed(this.body, this.headers, this.failure, this.extra);

  final UpdateRouteBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
