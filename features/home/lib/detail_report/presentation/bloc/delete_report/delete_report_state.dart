part of 'delete_report_bloc.dart';

@immutable
abstract class DeleteReportState extends Equatable {
  void when({
    void Function(DeleteReportInitial state)? onInitial,
    void Function(DeleteReportLoading state)? onLoading,
    void Function(DeleteReportFailed state)? onFailed,
    void Function(DeleteReportSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is DeleteReportInitial) {
      onInitial?.call(state);
    } else if (state is DeleteReportLoading) {
      onLoading?.call(state);
    } else if (state is DeleteReportFailed) {
      onFailed?.call(state);
    } else if (state is DeleteReportSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(DeleteReportInitial state)? onInitial,
    Widget Function(DeleteReportLoading state)? onLoading,
    Widget Function(DeleteReportFailed state)? onFailed,
    Widget Function(DeleteReportSuccess state)? onSuccess,
    Widget Function(DeleteReportState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is DeleteReportInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is DeleteReportLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is DeleteReportFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is DeleteReportSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class DeleteReportInitial extends DeleteReportState {
  @override
  List<Object?> get props => [];
}

class DeleteReportLoading extends DeleteReportState {
  DeleteReportLoading(this.body, this.headers, this.extra);

  final DeleteReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class DeleteReportSuccess extends DeleteReportState {
  DeleteReportSuccess(this.body, this.headers, this.data, this.extra);

  final DeleteReportBody body;
  final Map<String, String>? headers;
  final DeleteReportEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class DeleteReportFailed extends DeleteReportState {
  DeleteReportFailed(this.body, this.headers, this.failure, this.extra);

  final DeleteReportBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
