import 'data/models/response/change_password_response.dart'
    as change_password_response;
import 'domain/entities/change_password_entity.dart' as change_password_entity;

extension ChangePasswordResponseMapper
    on change_password_response.ChangePasswordResponse {
  change_password_entity.ChangePasswordEntity toEntity() =>
      change_password_entity.ChangePasswordEntity(
        success: success,
        message: message,
        data: data,
      );
}

extension ChangePasswordEntityMapper
    on change_password_entity.ChangePasswordEntity {
  change_password_response.ChangePasswordResponse toResponse() =>
      change_password_response.ChangePasswordResponse(
        success: success,
        message: message,
        data: data,
      );
}
