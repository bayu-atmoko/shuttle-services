part of 'complaint_bloc.dart';

@immutable
abstract class ComplaintEvent extends Equatable {}

class FetchComplaint extends ComplaintEvent {
  FetchComplaint(this.body, {this.headers, this.extra});

  final ComplaintBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
