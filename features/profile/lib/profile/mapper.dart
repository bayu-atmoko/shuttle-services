import 'package:core/core.dart';

import 'data/models/response/profile_response.dart' as profile_response;
import 'domain/entities/profile_entity.dart' as profile_entity;
import 'data/models/response/logout_response.dart' as logout_response;
import 'domain/entities/logout_entity.dart' as logout_entity;

extension ProfileResponseMapper on profile_response.ProfileResponse {
  profile_entity.ProfileEntity toEntity() => profile_entity.ProfileEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension ProfileEntityMapper on profile_entity.ProfileEntity {
  profile_response.ProfileResponse toResponse() =>
      profile_response.ProfileResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataProfileResponseMapper on profile_response.DataProfile {
  profile_entity.DataProfile toEntity() => profile_entity.DataProfile(
        userId: userId,
        email: email,
        name: name,
        role: role,
        phone: phone,
        address: address,
        gender: gender,
        vehicle: vehicle,
        profilePicture: profilePicture,
        deletedAt: deletedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        village: village,
        district: district,
        regency: regency,
        province: province,
      );
}

extension DataProfileEntityMapper on profile_entity.DataProfile {
  profile_response.DataProfile toResponse() => profile_response.DataProfile(
        userId: userId,
        email: email,
        name: name,
        role: role,
        phone: phone,
        address: address,
        gender: gender,
        vehicle: vehicle,
        profilePicture: profilePicture,
        deletedAt: deletedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        village: village,
        district: district,
        regency: regency,
        province: province,
      );
}

extension ExtraUserMapper on profile_entity.DataProfile {
  ExtraUser toParams() => ExtraUser(
        userId: userId,
        email: email,
        name: name,
        role: role,
        phone: phone,
        address: address,
        gender: gender,
        vehicle: vehicle,
        profilePicture: profilePicture,
        deletedAt: deletedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        village: village,
        district: district,
        regency: regency,
        province: province,
      );
}

extension LogoutResponseMapper on logout_response.LogoutResponse {
  logout_entity.LogoutEntity toEntity() => logout_entity.LogoutEntity(
        success: success,
        message: message,
        data: data,
      );
}

extension LogoutEntityMapper on logout_entity.LogoutEntity {
  logout_response.LogoutResponse toResponse() => logout_response.LogoutResponse(
        success: success,
        message: message,
        data: data,
      );
}
