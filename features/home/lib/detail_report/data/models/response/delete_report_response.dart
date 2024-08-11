import 'dart:convert';

import 'package:core/core.dart';

class DeleteReportResponse extends Equatable {
  const DeleteReportResponse({
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

  factory DeleteReportResponse.fromMap(Map<String, dynamic> map) {
    return DeleteReportResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteReportResponse.fromJson(String source) =>
      DeleteReportResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
