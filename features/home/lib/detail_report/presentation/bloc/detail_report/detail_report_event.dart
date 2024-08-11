part of 'detail_report_bloc.dart';

@immutable
abstract class DetailReportEvent extends Equatable {}

class FetchDetailReport extends DetailReportEvent {
  FetchDetailReport(this.body, {this.headers, this.extra});

  final DetailReportBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
