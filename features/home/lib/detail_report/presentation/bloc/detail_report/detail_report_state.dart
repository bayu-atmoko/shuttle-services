part of 'detail_report_bloc.dart';

@immutable
abstract class DetailReportState extends Equatable {
  void when({
    void Function(DetailReportInitial state)? onInitial,
    void Function(DetailReportLoading state)? onLoading,
    void Function(DetailReportFailed state)? onFailed,
    void Function(DetailReportSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is DetailReportInitial) {
      onInitial?.call(state);
    } else if (state is DetailReportLoading) {
      onLoading?.call(state);
    } else if (state is DetailReportFailed) {
      onFailed?.call(state);
    } else if (state is DetailReportSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(DetailReportInitial state)? onInitial,
    Widget Function(DetailReportLoading state)? onLoading,
    Widget Function(DetailReportFailed state)? onFailed,
    Widget Function(DetailReportSuccess state)? onSuccess,
    Widget Function(DetailReportState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is DetailReportInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is DetailReportLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is DetailReportFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is DetailReportSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class DetailReportInitial extends DetailReportState {
  @override
  List<Object?> get props => [];
}

class DetailReportLoading extends DetailReportState {
  DetailReportLoading(this.body, this.headers, this.extra);

  final DetailReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class DetailReportSuccess extends DetailReportState {
  DetailReportSuccess(this.body, this.headers, this.data, this.extra);

  final DetailReportBody body;
  final Map<String, String>? headers;
  final DetailReportEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class DetailReportFailed extends DetailReportState {
  DetailReportFailed(this.body, this.headers, this.failure, this.extra);

  final DetailReportBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
