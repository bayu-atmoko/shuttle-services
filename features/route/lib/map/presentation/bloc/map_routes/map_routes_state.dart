part of 'map_routes_bloc.dart';

@immutable
abstract class MapRoutesState extends Equatable {
  void when({
    void Function(MapRoutesInitial state)? onInitial,
    void Function(MapRoutesLoading state)? onLoading,
    void Function(MapRoutesFailed state)? onFailed,
    void Function(MapRoutesSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is MapRoutesInitial) {
      onInitial?.call(state);
    } else if (state is MapRoutesLoading) {
      onLoading?.call(state);
    } else if (state is MapRoutesFailed) {
      onFailed?.call(state);
    } else if (state is MapRoutesSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(MapRoutesInitial state)? onInitial,
    Widget Function(MapRoutesLoading state)? onLoading,
    Widget Function(MapRoutesFailed state)? onFailed,
    Widget Function(MapRoutesSuccess state)? onSuccess,
    Widget Function(MapRoutesState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is MapRoutesInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is MapRoutesLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is MapRoutesFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is MapRoutesSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class MapRoutesInitial extends MapRoutesState {
  @override
  List<Object?> get props => [];
}

class MapRoutesLoading extends MapRoutesState {
  @override
  List<Object?> get props => [];
}

class MapRoutesSuccess extends MapRoutesState {
  MapRoutesSuccess(this.data);

  final MapRoutesEntity data;

  @override
  List<Object?> get props => [data];
}

class MapRoutesFailed extends MapRoutesState {
  MapRoutesFailed(this.failure);
  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}
