part of 'direction_bloc.dart';

@immutable
abstract class DirectionState extends Equatable {
  void when({
    void Function(DirectionInitial state)? onInitial,
    void Function(DirectionLoading state)? onLoading,
    void Function(DirectionFailed state)? onFailed,
    void Function(DirectionSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is DirectionInitial) {
      onInitial?.call(state);
    } else if (state is DirectionLoading) {
      onLoading?.call(state);
    } else if (state is DirectionFailed) {
      onFailed?.call(state);
    } else if (state is DirectionSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(DirectionInitial state)? onInitial,
    Widget Function(DirectionLoading state)? onLoading,
    Widget Function(DirectionFailed state)? onFailed,
    Widget Function(DirectionSuccess state)? onSuccess,
    Widget Function(DirectionState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is DirectionInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is DirectionLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is DirectionFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is DirectionSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class DirectionInitial extends DirectionState {
  @override
  List<Object?> get props => [];
}

class DirectionLoading extends DirectionState {
  @override
  List<Object?> get props => [];
}

class DirectionSuccess extends DirectionState {
  DirectionSuccess(this.data);

  final DirectionEntity data;

  @override
  List<Object?> get props => [data];
}

class DirectionFailed extends DirectionState {
  DirectionFailed(this.failure);
  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}
