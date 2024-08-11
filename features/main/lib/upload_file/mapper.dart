import 'data/models/response/upload_file_response.dart' as upload_file_response;
import 'domain/entities/upload_file_entity.dart' as upload_file_entity;

extension UploadFileResponseMapper on upload_file_response.UploadFileResponse {
  upload_file_entity.UploadFileEntity toEntity() =>
      upload_file_entity.UploadFileEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension UploadFileEntityMapper on upload_file_entity.UploadFileEntity {
  upload_file_response.UploadFileResponse toResponse() =>
      upload_file_response.UploadFileResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataUploadFileResponseMapper on upload_file_response.DataUploadFile {
  upload_file_entity.DataUploadFile toEntity() =>
      upload_file_entity.DataUploadFile(
        imageUrl: imageUrl,
      );
}

extension DataUploadFileEntityMapper on upload_file_entity.DataUploadFile {
  upload_file_response.DataUploadFile toResponse() =>
      upload_file_response.DataUploadFile(
        imageUrl: imageUrl,
      );
}
