part of 'delete_report_bloc.dart';

@immutable
abstract class DeleteReportEvent extends Equatable {}

class FetchDeleteReport extends DeleteReportEvent {
  FetchDeleteReport(this.body, {this.headers, this.extra});

  final DeleteReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
