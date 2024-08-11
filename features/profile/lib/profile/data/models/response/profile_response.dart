import 'dart:convert';

import 'package:core/core.dart';

class ProfileResponse extends Equatable {
  const ProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataProfile? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory ProfileResponse.fromMap(Map<String, dynamic> map) {
    return ProfileResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataProfile.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileResponse.fromJson(String source) =>
      ProfileResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataProfile extends Equatable {
  const DataProfile({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
    required this.phone,
    required this.address,
    required this.gender,
    required this.vehicle,
    required this.profilePicture,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.village,
    required this.district,
    required this.regency,
    required this.province,
  });

  final int? userId;
  final String? email;
  final String? name;
  final String? role;
  final String? phone;
  final String? address;
  final String? gender;
  final String? vehicle;
  final String? profilePicture;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? village;
  final String? district;
  final String? regency;
  final String? province;

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'email': email,
      'name': name,
      'role': role,
      'phone': phone,
      'address': address,
      'gender': gender,
      'vehicle': vehicle,
      'profile_picture': profilePicture,
      'deleted_at': deletedAt,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'village': village,
      'district': district,
      'regency': regency,
      'province': province,
    };
  }

  factory DataProfile.fromMap(Map<String, dynamic> map) {
    return DataProfile(
      userId: int.tryParse(map['user_id']?.toString() ?? ''),
      email: map['email'],
      name: map['name'],
      role: map['role'],
      phone: map['phone'],
      address: map['address'],
      gender: map['gender'],
      vehicle: map['vehicle'],
      profilePicture: map['profile_picture'],
      deletedAt: map['deleted_at'],
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      village: map['village'],
      district: map['district'],
      regency: map['regency'],
      province: map['province'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataProfile.fromJson(String source) =>
      DataProfile.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        userId,
        email,
        name,
        role,
        phone,
        address,
        gender,
        vehicle,
        profilePicture,
        deletedAt,
        createdAt,
        updatedAt,
        village,
        district,
        regency,
        province,
      ];
}
