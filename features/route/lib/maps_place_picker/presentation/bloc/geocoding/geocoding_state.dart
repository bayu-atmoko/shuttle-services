part of 'geocoding_bloc.dart';

@immutable
abstract class GeocodingState extends Equatable {
  void when({
    void Function(GeocodingInitial state)? onInitial,
    void Function(GeocodingLoading state)? onLoading,
    void Function(GeocodingFailed state)? onFailed,
    void Function(GeocodingSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is GeocodingInitial) {
      onInitial?.call(state);
    } else if (state is GeocodingLoading) {
      onLoading?.call(state);
    } else if (state is GeocodingFailed) {
      onFailed?.call(state);
    } else if (state is GeocodingSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(GeocodingInitial state)? onInitial,
    Widget Function(GeocodingLoading state)? onLoading,
    Widget Function(GeocodingFailed state)? onFailed,
    Widget Function(GeocodingSuccess state)? onSuccess,
    Widget Function(GeocodingState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is GeocodingInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is GeocodingLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is GeocodingFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is GeocodingSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class GeocodingInitial extends GeocodingState {
  @override
  List<Object?> get props => [];
}

class GeocodingLoading extends GeocodingState {
  @override
  List<Object?> get props => [];
}

class GeocodingSuccess extends GeocodingState {
  GeocodingSuccess(this.data);

  final GeocodingEntity data;

  @override
  List<Object?> get props => [data];
}

class GeocodingFailed extends GeocodingState {
  GeocodingFailed(this.failure);
  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}
