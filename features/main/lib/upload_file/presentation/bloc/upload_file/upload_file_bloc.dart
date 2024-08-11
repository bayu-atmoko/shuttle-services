import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../data/models/body/upload_file_body.dart';
import '../../../domain/entities/upload_file_entity.dart';
import '../../../domain/usecases/upload_file_use_case.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';

class UploadFileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  final UploadFileUseCase useCase;

  UploadFileBloc({
    required this.useCase,
  }) : super(UploadFileInitial()) {
    on<FetchUploadFile>((event, emit) async {
      emit(UploadFileLoading(event.headers, event.extra));
      final result = await useCase(event.body, headers: event.headers);
      emit(
        result.fold(
          (failure) =>
              UploadFileFailed(event.body, event.headers, failure, event.extra),
          (success) => UploadFileSuccess(
              event.body, event.headers, success, event.extra),
        ),
      );
    });

    on<FetchMultipleUploadFile>((event, emit) async {
      emit(UploadFileLoading(event.headers, event.extra));

      List<String> imageUrl = [];

      for (var element in event.body.files!) {
        final result = await useCase(
          UploadFileBody(
            files: element,
            type: event.body.type,
          ),
          headers: event.headers,
        );
        result.fold(
          (failure) {},
          (success) {
            if (success.data?.imageUrl != null &&
                success.data!.imageUrl.isNotNullOrEmpty) {
              imageUrl.add(success.data!.imageUrl!);
            }
          },
        );
      }

      emit(
        UploadMultipleFileSuccess(
          event.headers,
          imageUrl,
          event.extra,
        ),
      );
    });
  }
}
