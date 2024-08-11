import 'dart:convert';

import 'package:core/core.dart';

class LogoutResponse extends Equatable {
  const LogoutResponse({
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

  factory LogoutResponse.fromMap(Map<String, dynamic> map) {
    return LogoutResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LogoutResponse.fromJson(String source) =>
      LogoutResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
