part of 'list_route_bloc.dart';

@immutable
abstract class ListRouteState extends Equatable {
  void when({
    void Function(ListRouteInitial state)? onInitial,
    void Function(ListRouteLoading state)? onLoading,
    void Function(ListRouteFailed state)? onFailed,
    void Function(ListRouteSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is ListRouteInitial) {
      onInitial?.call(state);
    } else if (state is ListRouteLoading) {
      onLoading?.call(state);
    } else if (state is ListRouteFailed) {
      onFailed?.call(state);
    } else if (state is ListRouteSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(ListRouteInitial state)? onInitial,
    Widget Function(ListRouteLoading state)? onLoading,
    Widget Function(ListRouteFailed state)? onFailed,
    Widget Function(ListRouteSuccess state)? onSuccess,
    Widget Function(ListRouteState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ListRouteInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ListRouteLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ListRouteFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ListRouteSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ListRouteInitial extends ListRouteState {
  @override
  List<Object?> get props => [];
}

class ListRouteLoading extends ListRouteState {
  ListRouteLoading(this.body, this.headers, this.extra);

  final ListRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class ListRouteSuccess extends ListRouteState {
  ListRouteSuccess(this.body, this.headers, this.data, this.extra);

  final ListRouteBody body;
  final Map<String, String>? headers;
  final ListRouteEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class ListRouteFailed extends ListRouteState {
  ListRouteFailed(this.body, this.headers, this.failure, this.extra);

  final ListRouteBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
