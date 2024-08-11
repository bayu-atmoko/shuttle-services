part of 'upload_file_bloc.dart';

@immutable
abstract class UploadFileState extends Equatable {
  void when({
    void Function(UploadFileInitial state)? onInitial,
    void Function(UploadFileLoading state)? onLoading,
    void Function(UploadFileFailed state)? onFailed,
    void Function(UploadFileSuccess state)? onSuccess,
    void Function(UploadMultipleFileSuccess state)? onSuccessMultiple,
  }) {
    final state = this;
    if (state is UploadFileInitial) {
      onInitial?.call(state);
    } else if (state is UploadFileLoading) {
      onLoading?.call(state);
    } else if (state is UploadFileFailed) {
      onFailed?.call(state);
    } else if (state is UploadFileSuccess) {
      onSuccess?.call(state);
    } else if (state is UploadMultipleFileSuccess) {
      onSuccessMultiple?.call(state);
    }
  }

  Widget builder({
    Widget Function(UploadFileInitial state)? onInitial,
    Widget Function(UploadFileLoading state)? onLoading,
    Widget Function(UploadFileFailed state)? onFailed,
    Widget Function(UploadFileSuccess state)? onSuccess,
    Widget Function(UploadMultipleFileSuccess state)? onSuccessMultiple,
    Widget Function(UploadFileState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is UploadFileInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is UploadFileLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is UploadFileFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is UploadFileSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else if (state is UploadMultipleFileSuccess) {
      return onSuccessMultiple?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class UploadFileInitial extends UploadFileState {
  @override
  List<Object?> get props => [];
}

class UploadFileLoading extends UploadFileState {
  UploadFileLoading(this.headers, this.extra);

  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [headers, extra];
}

class UploadMultipleFileSuccess extends UploadFileState {
  UploadMultipleFileSuccess(this.headers, this.data, this.extra);

  final Map<String, String>? headers;
  final List<String> data;
  final dynamic extra;

  @override
  List<Object?> get props => [headers, data, extra];
}

class UploadFileSuccess extends UploadFileState {
  UploadFileSuccess(this.body, this.headers, this.data, this.extra);

  final UploadFileBody body;
  final Map<String, String>? headers;
  final UploadFileEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}

class UploadFileFailed extends UploadFileState {
  UploadFileFailed(this.body, this.headers, this.failure, this.extra);

  final UploadFileBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}
