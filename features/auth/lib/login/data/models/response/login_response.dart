import 'dart:convert';

import 'package:core/core.dart';

class LoginResponse extends Equatable {
  const LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataLogin? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataLogin.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'profile': profile?.toMap(),
      'access_token': accessToken,
    };
  }

  factory DataLogin.fromMap(Map<String, dynamic> map) {
    return DataLogin(
      profile:
          map['profile'] == null ? null : ProfileLogin.fromMap(map['profile']),
      accessToken: map['access_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataLogin.fromJson(String source) =>
      DataLogin.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'email': email,
      'name': name,
      'role': role,
      'phone': phone,
      'address': address,
      'gender': gender,
      'profile_picture': profilePicture,
      'deleted_at': deletedAt,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
    };
  }

  factory ProfileLogin.fromMap(Map<String, dynamic> map) {
    return ProfileLogin(
      userId: int.tryParse(map['user_id']?.toString() ?? ''),
      email: map['email'],
      name: map['name'],
      role: map['role'],
      phone: map['phone'],
      address: map['address'],
      gender: map['gender'],
      profilePicture: map['profile_picture'],
      deletedAt: map['deleted_at'],
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileLogin.fromJson(String source) =>
      ProfileLogin.fromMap(json.decode(source));

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
