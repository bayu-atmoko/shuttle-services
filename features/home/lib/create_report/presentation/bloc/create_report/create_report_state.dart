part of 'create_report_bloc.dart';

@immutable
abstract class CreateReportState extends Equatable {
  void when({
    void Function(CreateReportInitial state)? onInitial,
    void Function(CreateReportLoading state)? onLoading,
    void Function(CreateReportFailed state)? onFailed,
    void Function(CreateReportSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is CreateReportInitial) {
      onInitial?.call(state);
    } else if (state is CreateReportLoading) {
      onLoading?.call(state);
    } else if (state is CreateReportFailed) {
      onFailed?.call(state);
    } else if (state is CreateReportSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(CreateReportInitial state)? onInitial,
    Widget Function(CreateReportLoading state)? onLoading,
    Widget Function(CreateReportFailed state)? onFailed,
    Widget Function(CreateReportSuccess state)? onSuccess,
    Widget Function(CreateReportState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is CreateReportInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is CreateReportLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is CreateReportFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is CreateReportSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class CreateReportInitial extends CreateReportState {
  @override
  List<Object?> get props => [];
}

class CreateReportLoading extends CreateReportState {
  CreateReportLoading(this.body, this.headers, this.extra);

  final CreateReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class CreateReportSuccess extends CreateReportState {
  CreateReportSuccess(this.body, this.headers, this.data, this.extra);

  final CreateReportBody body;
  final Map<String, String>? headers;
  final CreateReportEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class CreateReportFailed extends CreateReportState {
  CreateReportFailed(this.body, this.headers, this.failure, this.extra);

  final CreateReportBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
