import 'dart:convert';

import 'package:core/core.dart';

class ChangePasswordResponse extends Equatable {
  const ChangePasswordResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final dynamic data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }

  factory ChangePasswordResponse.fromMap(Map<String, dynamic> map) {
    return ChangePasswordResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordResponse.fromJson(String source) =>
      ChangePasswordResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
