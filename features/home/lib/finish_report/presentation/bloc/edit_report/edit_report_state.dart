part of 'edit_report_bloc.dart';

@immutable
abstract class EditReportState extends Equatable {
  void when({
    void Function(EditReportInitial state)? onInitial,
    void Function(EditReportLoading state)? onLoading,
    void Function(EditReportFailed state)? onFailed,
    void Function(EditReportSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is EditReportInitial) {
      onInitial?.call(state);
    } else if (state is EditReportLoading) {
      onLoading?.call(state);
    } else if (state is EditReportFailed) {
      onFailed?.call(state);
    } else if (state is EditReportSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(EditReportInitial state)? onInitial,
    Widget Function(EditReportLoading state)? onLoading,
    Widget Function(EditReportFailed state)? onFailed,
    Widget Function(EditReportSuccess state)? onSuccess,
    Widget Function(EditReportState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is EditReportInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is EditReportLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is EditReportFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is EditReportSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class EditReportInitial extends EditReportState {
  @override
  List<Object?> get props => [];
}

class EditReportLoading extends EditReportState {
  EditReportLoading(this.body, this.headers, this.extra);

  final EditReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class EditReportSuccess extends EditReportState {
  EditReportSuccess(this.body, this.headers, this.data, this.extra);

  final EditReportBody body;
  final Map<String, String>? headers;
  final EditReportEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class EditReportFailed extends EditReportState {
  EditReportFailed(this.body, this.headers, this.failure, this.extra);

  final EditReportBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
