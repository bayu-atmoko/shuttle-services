import 'dart:convert';

import 'package:core/core.dart';

class ComplaintResponse extends Equatable {
  const ComplaintResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<DataComplaint>? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.map((e) => e.toMap()).toList(),
    };
  }

  factory ComplaintResponse.fromMap(Map<String, dynamic> map) {
    return ComplaintResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null
          ? null
          : List.from(
              (map['data'] as List).map((e) => DataComplaint.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplaintResponse.fromJson(String source) =>
      ComplaintResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataComplaint extends Equatable {
  const DataComplaint({
    required this.complaintId,
    required this.title,
    required this.complaintType,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? complaintId;
  final String? title;
  final String? complaintType;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'complaint_id': complaintId,
      'title': title,
      'complaint_type': complaintType,
      'description': description,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
    };
  }

  factory DataComplaint.fromMap(Map<String, dynamic> map) {
    return DataComplaint(
      complaintId: int.tryParse(map['complaint_id']?.toString() ?? ''),
      title: map['title'],
      complaintType: map['complaint_type'],
      description: map['description'],
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataComplaint.fromJson(String source) =>
      DataComplaint.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        complaintId,
        title,
        complaintType,
        description,
        createdAt,
        updatedAt,
      ];
}
