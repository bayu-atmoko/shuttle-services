part of 'cancel_report_bloc.dart';

@immutable
abstract class CancelReportEvent extends Equatable {}

class FetchCancelReport extends CancelReportEvent {
  FetchCancelReport(this.body, {this.headers, this.extra});

  final ListReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
