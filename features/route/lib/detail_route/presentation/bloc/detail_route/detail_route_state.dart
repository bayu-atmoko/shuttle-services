part of 'detail_route_bloc.dart';

@immutable
abstract class DetailRouteState extends Equatable {
  void when({
    void Function(DetailRouteInitial state)? onInitial,
    void Function(DetailRouteLoading state)? onLoading,
    void Function(DetailRouteFailed state)? onFailed,
    void Function(DetailRouteSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is DetailRouteInitial) {
      onInitial?.call(state);
    } else if (state is DetailRouteLoading) {
      onLoading?.call(state);
    } else if (state is DetailRouteFailed) {
      onFailed?.call(state);
    } else if (state is DetailRouteSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(DetailRouteInitial state)? onInitial,
    Widget Function(DetailRouteLoading state)? onLoading,
    Widget Function(DetailRouteFailed state)? onFailed,
    Widget Function(DetailRouteSuccess state)? onSuccess,
    Widget Function(DetailRouteState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is DetailRouteInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is DetailRouteLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is DetailRouteFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is DetailRouteSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class DetailRouteInitial extends DetailRouteState {
  @override
  List<Object?> get props => [];
}

class DetailRouteLoading extends DetailRouteState {
  DetailRouteLoading(this.body, this.headers, this.extra);

  final DetailRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class DetailRouteSuccess extends DetailRouteState {
  DetailRouteSuccess(this.body, this.headers, this.data, this.extra);

  final DetailRouteBody body;
  final Map<String, String>? headers;
  final DetailRouteEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class DetailRouteFailed extends DetailRouteState {
  DetailRouteFailed(this.body, this.headers, this.failure, this.extra);

  final DetailRouteBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
