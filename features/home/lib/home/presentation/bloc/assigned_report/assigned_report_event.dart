part of 'assigned_report_bloc.dart';

@immutable
abstract class AssignedReportEvent extends Equatable {}

class FetchAssignedReport extends AssignedReportEvent {
  FetchAssignedReport(this.body, {this.headers, this.extra});

  final ListReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
