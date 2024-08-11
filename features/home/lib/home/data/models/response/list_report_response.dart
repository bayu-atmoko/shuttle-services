import 'dart:convert';

import 'package:core/core.dart';

class ListReportResponse extends Equatable {
  const ListReportResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataListReport? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory ListReportResponse.fromMap(Map<String, dynamic> map) {
    return ListReportResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataListReport.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListReportResponse.fromJson(String source) =>
      ListReportResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataListReport extends Equatable {
  const DataListReport({
    required this.data,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  final List<AlphaDataListReport>? data;
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((e) => e.toMap()).toList(),
      'total': total,
      'per_page': perPage,
      'current_page': currentPage,
      'last_page': lastPage,
    };
  }

  factory DataListReport.fromMap(Map<String, dynamic> map) {
    return DataListReport(
      data: map['data'] == null
          ? null
          : List.from(
              (map['data'] as List).map((e) => AlphaDataListReport.fromMap(e))),
      total: int.tryParse(map['total']?.toString() ?? ''),
      perPage: int.tryParse(map['per_page']?.toString() ?? ''),
      currentPage: int.tryParse(map['current_page']?.toString() ?? ''),
      lastPage: int.tryParse(map['last_page']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataListReport.fromJson(String source) =>
      DataListReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        data,
        total,
        perPage,
        currentPage,
        lastPage,
      ];
}

class AlphaDataListReport extends Equatable {
  const AlphaDataListReport({
    required this.reportId,
    required this.creatorId,
    required this.officerId,
    required this.status,
    required this.description,
    required this.complaintId,
    required this.locationId,
    required this.routeId,
    required this.createdAt,
    required this.updatedAt,
    required this.finishedAt,
    required this.priority,
    required this.cancellationReason,
    required this.deletedAt,
    required this.locationName,
    required this.locationAddress,
    required this.locationLatitude,
    required this.locationLongitude,
    required this.officerName,
    required this.creatorName,
    required this.complaintTitle,
  });

  final int? reportId;
  final int? creatorId;
  final int? officerId;
  final String? status;
  final String? description;
  final int? complaintId;
  final int? locationId;
  final int? routeId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? finishedAt;
  final int? priority;
  final String? cancellationReason;
  final DateTime? deletedAt;
  final String? locationName;
  final String? locationAddress;
  final double? locationLatitude;
  final double? locationLongitude;
  final String? officerName;
  final String? creatorName;
  final String? complaintTitle;

  Map<String, dynamic> toMap() {
    return {
      'report_id': reportId,
      'creator_id': creatorId,
      'officer_id': officerId,
      'status': status,
      'description': description,
      'complaint_id': complaintId,
      'location_id': locationId,
      'route_id': routeId,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'finished_at': finishedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'priority': priority,
      'cancellation_reason': cancellationReason,
      'deleted_at': deletedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'location_name': locationName,
      'location_address': locationAddress,
      'location_latitude': locationLatitude,
      'location_longitude': locationLongitude,
      'officer_name': officerName,
      'creator_name': creatorName,
      'complaint_title': complaintTitle,
    };
  }

  factory AlphaDataListReport.fromMap(Map<String, dynamic> map) {
    return AlphaDataListReport(
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      creatorId: int.tryParse(map['creator_id']?.toString() ?? ''),
      officerId: int.tryParse(map['officer_id']?.toString() ?? ''),
      status: map['status'],
      description: map['description'],
      complaintId: int.tryParse(map['complaint_id']?.toString() ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      routeId: int.tryParse(map['route_id']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      finishedAt: DateTime.tryParse(map['finished_at'] ?? ''),
      priority: int.tryParse(map['priority']?.toString() ?? ''),
      cancellationReason: map['cancellation_reason'],
      deletedAt: DateTime.tryParse(map['deleted_at'] ?? ''),
      locationName: map['location_name'],
      locationAddress: map['location_address'],
      locationLatitude: map['location_latitude'] != null
          ? double.tryParse(map['location_latitude']?.toString() ?? '')
          : null,
      locationLongitude: map['location_longitude'] != null
          ? double.tryParse(map['location_longitude']?.toString() ?? '')
          : null,
      officerName: map['officer_name'],
      creatorName: map['creator_name'],
      complaintTitle: map['complaint_title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlphaDataListReport.fromJson(String source) =>
      AlphaDataListReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        reportId,
        creatorId,
        officerId,
        status,
        description,
        complaintId,
        locationId,
        routeId,
        createdAt,
        updatedAt,
        finishedAt,
        priority,
        cancellationReason,
        deletedAt,
        locationName,
        locationAddress,
        locationLatitude,
        locationLongitude,
        officerName,
        creatorName,
        complaintTitle,
      ];
}
