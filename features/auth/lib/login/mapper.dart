import 'data/models/response/login_response.dart' as login_response;
import 'domain/entities/login_entity.dart' as login_entity;

extension LoginResponseMapper on login_response.LoginResponse {
  login_entity.LoginEntity toEntity() => login_entity.LoginEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension LoginEntityMapper on login_entity.LoginEntity {
  login_response.LoginResponse toResponse() => login_response.LoginResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataLoginResponseMapper on login_response.DataLogin {
  login_entity.DataLogin toEntity() => login_entity.DataLogin(
        profile: profile?.toEntity(),
        accessToken: accessToken,
      );
}

extension DataLoginEntityMapper on login_entity.DataLogin {
  login_response.DataLogin toResponse() => login_response.DataLogin(
        profile: profile?.toResponse(),
        accessToken: accessToken,
      );
}

extension ProfileLoginResponseMapper on login_response.ProfileLogin {
  login_entity.ProfileLogin toEntity() => login_entity.ProfileLogin(
        userId: userId,
        email: email,
        name: name,
        role: role,
        phone: phone,
        address: address,
        gender: gender,
        profilePicture: profilePicture,
        deletedAt: deletedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension ProfileLoginEntityMapper on login_entity.ProfileLogin {
  login_response.ProfileLogin toResponse() => login_response.ProfileLogin(
        userId: userId,
        email: email,
        name: name,
        role: role,
        phone: phone,
        address: address,
        gender: gender,
        profilePicture: profilePicture,
        deletedAt: deletedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
