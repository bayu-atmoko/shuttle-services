part of 'create_report_bloc.dart';

@immutable
abstract class CreateReportEvent extends Equatable {}

class FetchCreateReport extends CreateReportEvent {
  FetchCreateReport(this.body, {this.headers, this.extra});

  final CreateReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
