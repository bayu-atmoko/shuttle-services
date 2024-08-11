part of 'new_report_bloc.dart';

@immutable
abstract class NewReportEvent extends Equatable {}

class FetchNewReport extends NewReportEvent {
  FetchNewReport(this.body, {this.headers, this.extra});

  final ListReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
