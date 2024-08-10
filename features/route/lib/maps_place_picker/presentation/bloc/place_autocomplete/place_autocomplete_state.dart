part of 'place_autocomplete_bloc.dart';

@immutable
abstract class PlaceAutocompleteState extends Equatable {
  void when({
    void Function(PlaceAutocompleteInitial state)? onInitial,
    void Function(PlaceAutocompleteLoading state)? onLoading,
    void Function(PlaceAutocompleteFailed state)? onFailed,
    void Function(PlaceAutocompleteSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is PlaceAutocompleteInitial) {
      onInitial?.call(state);
    } else if (state is PlaceAutocompleteLoading) {
      onLoading?.call(state);
    } else if (state is PlaceAutocompleteFailed) {
      onFailed?.call(state);
    } else if (state is PlaceAutocompleteSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(PlaceAutocompleteInitial state)? onInitial,
    Widget Function(PlaceAutocompleteLoading state)? onLoading,
    Widget Function(PlaceAutocompleteFailed state)? onFailed,
    Widget Function(PlaceAutocompleteSuccess state)? onSuccess,
    Widget Function(PlaceAutocompleteState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is PlaceAutocompleteInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is PlaceAutocompleteLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is PlaceAutocompleteFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is PlaceAutocompleteSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class PlaceAutocompleteInitial extends PlaceAutocompleteState {
  @override
  List<Object?> get props => [];
}

class PlaceAutocompleteLoading extends PlaceAutocompleteState {
  @override
  List<Object?> get props => [];
}

class PlaceAutocompleteSuccess extends PlaceAutocompleteState {
  PlaceAutocompleteSuccess(this.data);

  final PlaceAutocompleteEntity data;

  @override
  List<Object?> get props => [data];
}

class PlaceAutocompleteFailed extends PlaceAutocompleteState {
  PlaceAutocompleteFailed(this.failure);
  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}
