import 'dart:convert';

import 'package:core/core.dart';

class RegisterResponse extends Equatable {
  const RegisterResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataRegister? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataRegister.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataRegister extends Equatable {
  const DataRegister({
    required this.data,
    required this.token,
  });

  final AlphaDataRegister? data;
  final String? token;

  Map<String, dynamic> toMap() {
    return {
      'data': data?.toMap(),
      'token': token,
    };
  }

  factory DataRegister.fromMap(Map<String, dynamic> map) {
    return DataRegister(
      data: map['data'] == null ? null : AlphaDataRegister.fromMap(map['data']),
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataRegister.fromJson(String source) =>
      DataRegister.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        data,
        token,
      ];
}

class AlphaDataRegister extends Equatable {
  const AlphaDataRegister({
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.userId,
  });

  final String? email;
  final String? name;
  final String? phone;
  final String? role;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? userId;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'role': role,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'user_id': userId,
    };
  }

  factory AlphaDataRegister.fromMap(Map<String, dynamic> map) {
    return AlphaDataRegister(
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      role: map['role'],
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      userId: int.tryParse(map['user_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaDataRegister.fromJson(String source) =>
      AlphaDataRegister.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        email,
        name,
        phone,
        role,
        updatedAt,
        createdAt,
        userId,
      ];
}
