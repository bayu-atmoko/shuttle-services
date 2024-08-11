part of 'cleaned_report_bloc.dart';

@immutable
abstract class CleanedReportEvent extends Equatable {}

class FetchCleanedReport extends CleanedReportEvent {
  FetchCleanedReport(this.body, {this.headers, this.extra});

  final ListReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
