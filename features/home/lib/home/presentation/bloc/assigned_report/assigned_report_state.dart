part of 'assigned_report_bloc.dart';

@immutable
abstract class AssignedReportState extends Equatable {
  void when({
    void Function(NewReportInitial state)? onInitial,
    void Function(NewReportLoading state)? onLoading,
    void Function(NewReportFailed state)? onFailed,
    void Function(NewReportSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is NewReportInitial) {
      onInitial?.call(state);
    } else if (state is NewReportLoading) {
      onLoading?.call(state);
    } else if (state is NewReportFailed) {
      onFailed?.call(state);
    } else if (state is NewReportSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(NewReportInitial state)? onInitial,
    Widget Function(NewReportLoading state)? onLoading,
    Widget Function(NewReportFailed state)? onFailed,
    Widget Function(NewReportSuccess state)? onSuccess,
    Widget Function(AssignedReportState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is NewReportInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is NewReportLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is NewReportFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is NewReportSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class NewReportInitial extends AssignedReportState {
  @override
  List<Object?> get props => [];
}

class NewReportLoading extends AssignedReportState {
  NewReportLoading(this.body, this.headers, this.extra);

  final ListReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class NewReportSuccess extends AssignedReportState {
  NewReportSuccess(this.body, this.headers, this.data, this.extra);

  final ListReportBody body;
  final Map<String, String>? headers;
  final ListReportEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class NewReportFailed extends AssignedReportState {
  NewReportFailed(this.body, this.headers, this.failure, this.extra);

  final ListReportBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
