part of 'finish_report_bloc.dart';

@immutable
abstract class FinishReportEvent extends Equatable {}

class FetchFinishReport extends FinishReportEvent {
  FetchFinishReport(this.body, {this.headers, this.extra});

  final ListReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
