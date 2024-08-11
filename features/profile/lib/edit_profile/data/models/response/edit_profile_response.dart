import 'dart:convert';

import 'package:core/core.dart';

class EditProfileResponse extends Equatable {
  const EditProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataEditProfile? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory EditProfileResponse.fromMap(Map<String, dynamic> map) {
    return EditProfileResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataEditProfile.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EditProfileResponse.fromJson(String source) =>
      EditProfileResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataEditProfile extends Equatable {
  const DataEditProfile({
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

  factory DataEditProfile.fromMap(Map<String, dynamic> map) {
    return DataEditProfile(
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

  factory DataEditProfile.fromJson(String source) =>
      DataEditProfile.fromMap(json.decode(source));

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
