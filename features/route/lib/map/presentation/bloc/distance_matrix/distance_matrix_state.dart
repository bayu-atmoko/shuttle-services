part of 'distance_matrix_bloc.dart';

@immutable
abstract class DistanceMatrixState extends Equatable {
  void when({
    void Function(DistanceMatrixInitial state)? onInitial,
    void Function(DistanceMatrixLoading state)? onLoading,
    void Function(DistanceMatrixFailed state)? onFailed,
    void Function(DistanceMatrixSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is DistanceMatrixInitial) {
      onInitial?.call(state);
    } else if (state is DistanceMatrixLoading) {
      onLoading?.call(state);
    } else if (state is DistanceMatrixFailed) {
      onFailed?.call(state);
    } else if (state is DistanceMatrixSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(DistanceMatrixInitial state)? onInitial,
    Widget Function(DistanceMatrixLoading state)? onLoading,
    Widget Function(DistanceMatrixFailed state)? onFailed,
    Widget Function(DistanceMatrixSuccess state)? onSuccess,
    Widget Function(DistanceMatrixState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is DistanceMatrixInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is DistanceMatrixLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is DistanceMatrixFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is DistanceMatrixSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class DistanceMatrixInitial extends DistanceMatrixState {
  @override
  List<Object?> get props => [];
}

class DistanceMatrixLoading extends DistanceMatrixState {
  @override
  List<Object?> get props => [];
}

class DistanceMatrixSuccess extends DistanceMatrixState {
  DistanceMatrixSuccess(
    this.data,
    this.body,
  );

  final DistanceMatrixEntity data;
  final DistanceMatrixBody body;

  @override
  List<Object?> get props => [
        data,
        body,
      ];
}

class DistanceMatrixFailed extends DistanceMatrixState {
  DistanceMatrixFailed(this.failure);
  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}
