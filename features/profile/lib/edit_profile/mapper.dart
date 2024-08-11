import 'data/models/response/edit_profile_response.dart'
    as edit_profile_response;
import 'domain/entities/edit_profile_entity.dart' as edit_profile_entity;

extension EditProfileResponseMapper
    on edit_profile_response.EditProfileResponse {
  edit_profile_entity.EditProfileEntity toEntity() =>
      edit_profile_entity.EditProfileEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension EditProfileEntityMapper on edit_profile_entity.EditProfileEntity {
  edit_profile_response.EditProfileResponse toResponse() =>
      edit_profile_response.EditProfileResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataEditProfileResponseMapper
    on edit_profile_response.DataEditProfile {
  edit_profile_entity.DataEditProfile toEntity() =>
      edit_profile_entity.DataEditProfile(
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

extension DataEditProfileEntityMapper on edit_profile_entity.DataEditProfile {
  edit_profile_response.DataEditProfile toResponse() =>
      edit_profile_response.DataEditProfile(
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
