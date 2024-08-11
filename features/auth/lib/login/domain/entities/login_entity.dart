import 'package:core/core.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataLogin? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataLogin extends Equatable {
  const DataLogin({
    required this.profile,
    required this.accessToken,
  });

  final ProfileLogin? profile;
  final String? accessToken;

  @override
  List<Object?> get props => [
        profile,
        accessToken,
      ];
}

class ProfileLogin extends Equatable {
  const ProfileLogin({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
    required this.phone,
    required this.address,
    required this.gender,
    required this.profilePicture,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? userId;
  final String? email;
  final String? name;
  final String? role;
  final String? phone;
  final String? address;
  final String? gender;
  final String? profilePicture;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        userId,
        email,
        name,
        role,
        phone,
        address,
        gender,
        profilePicture,
        deletedAt,
        createdAt,
        updatedAt,
      ];
}
