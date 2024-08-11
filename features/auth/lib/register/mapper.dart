import 'data/models/response/register_response.dart' as register_response;
import 'domain/entities/register_entity.dart' as register_entity;

extension RegisterResponseMapper on register_response.RegisterResponse {
  register_entity.RegisterEntity toEntity() => register_entity.RegisterEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension RegisterEntityMapper on register_entity.RegisterEntity {
  register_response.RegisterResponse toResponse() =>
      register_response.RegisterResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataRegisterResponseMapper on register_response.DataRegister {
  register_entity.DataRegister toEntity() => register_entity.DataRegister(
        data: data?.toEntity(),
        token: token,
      );
}

extension DataRegisterEntityMapper on register_entity.DataRegister {
  register_response.DataRegister toResponse() => register_response.DataRegister(
        data: data?.toResponse(),
        token: token,
      );
}

extension AlphaDataRegisterResponseMapper
    on register_response.AlphaDataRegister {
  register_entity.AlphaDataRegister toEntity() =>
      register_entity.AlphaDataRegister(
        email: email,
        name: name,
        phone: phone,
        role: role,
        updatedAt: updatedAt,
        createdAt: createdAt,
        userId: userId,
      );
}

extension AlphaDataRegisterEntityMapper on register_entity.AlphaDataRegister {
  register_response.AlphaDataRegister toResponse() =>
      register_response.AlphaDataRegister(
        email: email,
        name: name,
        phone: phone,
        role: role,
        updatedAt: updatedAt,
        createdAt: createdAt,
        userId: userId,
      );
}
