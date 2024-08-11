part of 'route_optimization_bloc.dart';

@immutable
abstract class RouteOptimizationState extends Equatable {
  void when({
    void Function(RouteOptimizationInitial state)? onInitial,
    void Function(RouteOptimizationLoading state)? onLoading,
    void Function(RouteOptimizationFailed state)? onFailed,
    void Function(RouteOptimizationSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is RouteOptimizationInitial) {
      onInitial?.call(state);
    } else if (state is RouteOptimizationLoading) {
      onLoading?.call(state);
    } else if (state is RouteOptimizationFailed) {
      onFailed?.call(state);
    } else if (state is RouteOptimizationSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(RouteOptimizationInitial state)? onInitial,
    Widget Function(RouteOptimizationLoading state)? onLoading,
    Widget Function(RouteOptimizationFailed state)? onFailed,
    Widget Function(RouteOptimizationSuccess state)? onSuccess,
    Widget Function(RouteOptimizationState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is RouteOptimizationInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is RouteOptimizationLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is RouteOptimizationFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is RouteOptimizationSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class RouteOptimizationInitial extends RouteOptimizationState {
  @override
  List<Object?> get props => [];
}

class RouteOptimizationLoading extends RouteOptimizationState {
  RouteOptimizationLoading(this.body, this.headers, this.extra);

  final RouteOptimizationBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class RouteOptimizationSuccess extends RouteOptimizationState {
  RouteOptimizationSuccess(this.body, this.headers, this.data, this.extra);

  final RouteOptimizationBody body;
  final Map<String, String>? headers;
  final RouteOptimizationEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class RouteOptimizationFailed extends RouteOptimizationState {
  RouteOptimizationFailed(this.body, this.headers, this.failure, this.extra);

  final RouteOptimizationBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
