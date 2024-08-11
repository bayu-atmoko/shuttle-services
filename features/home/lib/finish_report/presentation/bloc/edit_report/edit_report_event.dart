part of 'edit_report_bloc.dart';

@immutable
abstract class EditReportEvent extends Equatable {}

class FetchEditReport extends EditReportEvent {
  FetchEditReport(this.body, {this.headers, this.extra});

  final EditReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
