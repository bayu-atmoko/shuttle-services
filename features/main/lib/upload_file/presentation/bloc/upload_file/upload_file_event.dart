part of 'upload_file_bloc.dart';

@immutable
abstract class UploadFileEvent extends Equatable {}

class FetchUploadFile extends UploadFileEvent {
  FetchUploadFile(this.body, {this.headers, this.extra});

  final UploadFileBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class FetchMultipleUploadFile extends UploadFileEvent {
  FetchMultipleUploadFile(this.body, {this.headers, this.extra});

  final MultipleUploadFileBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
