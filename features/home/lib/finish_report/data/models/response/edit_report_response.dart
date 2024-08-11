import 'dart:convert';

import 'package:core/core.dart';

class EditReportResponse extends Equatable {
  const EditReportResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataEditReport? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory EditReportResponse.fromMap(Map<String, dynamic> map) {
    return EditReportResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataEditReport.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EditReportResponse.fromJson(String source) =>
      EditReportResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataEditReport extends Equatable {
  const DataEditReport({
    required this.report,
    required this.reportMedia,
    required this.location,
  });

  final ReportEditReport? report;
  final List<ReportMediaEditReport>? reportMedia;
  final LocationEditReport? location;

  Map<String, dynamic> toMap() {
    return {
      'report': report?.toMap(),
      'report_media': reportMedia?.map((e) => e.toMap()).toList(),
      'location': location?.toMap(),
    };
  }

  factory DataEditReport.fromMap(Map<String, dynamic> map) {
    return DataEditReport(
      report: map['report'] == null
          ? null
          : ReportEditReport.fromMap(map['report']),
      reportMedia: map['report_media'] == null
          ? null
          : List.from((map['report_media'] as List)
              .map((e) => ReportMediaEditReport.fromMap(e))),
      location: map['location'] == null
          ? null
          : LocationEditReport.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataEditReport.fromJson(String source) =>
      DataEditReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        report,
        reportMedia,
        location,
      ];
}

class ReportEditReport extends Equatable {
  const ReportEditReport({
    required this.reportId,
    required this.creatorId,
    required this.officerId,
    required this.status,
    required this.description,
    required this.complaintId,
    required this.locationId,
    required this.createdAt,
    required this.updatedAt,
    required this.finishedAt,
    required this.cancellationReason,
    required this.deletedAt,
  });

  final int? reportId;
  final int? creatorId;
  final int? officerId;
  final String? status;
  final String? description;
  final int? complaintId;
  final int? locationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic finishedAt;
  final dynamic cancellationReason;
  final dynamic deletedAt;

  Map<String, dynamic> toMap() {
    return {
      'report_id': reportId,
      'creator_id': creatorId,
      'officer_id': officerId,
      'status': status,
      'description': description,
      'complaint_id': complaintId,
      'location_id': locationId,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'finished_at': finishedAt,
      'cancellation_reason': cancellationReason,
      'deleted_at': deletedAt,
    };
  }

  factory ReportEditReport.fromMap(Map<String, dynamic> map) {
    return ReportEditReport(
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      creatorId: int.tryParse(map['creator_id']?.toString() ?? ''),
      officerId: int.tryParse(map['officer_id']?.toString() ?? ''),
      status: map['status'],
      description: map['description'],
      complaintId: int.tryParse(map['complaint_id']?.toString() ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      finishedAt: map['finished_at'],
      cancellationReason: map['cancellation_reason'],
      deletedAt: map['deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportEditReport.fromJson(String source) =>
      ReportEditReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        reportId,
        creatorId,
        officerId,
        status,
        description,
        complaintId,
        locationId,
        createdAt,
        updatedAt,
        finishedAt,
        cancellationReason,
        deletedAt,
      ];
}

class LocationEditReport extends Equatable {
  const LocationEditReport({
    required this.locationId,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.district,
    required this.village,
  });

  final int? locationId;
  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? district;
  final String? village;

  Map<String, dynamic> toMap() {
    return {
      'location_id': locationId,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt,
      'district': district,
      'village': village,
    };
  }

  factory LocationEditReport.fromMap(Map<String, dynamic> map) {
    return LocationEditReport(
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      name: map['name'],
      address: map['address'],
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: map['deleted_at'],
      district: map['district'],
      village: map['village'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationEditReport.fromJson(String source) =>
      LocationEditReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        locationId,
        name,
        address,
        latitude,
        longitude,
        createdAt,
        updatedAt,
        deletedAt,
        district,
        village,
      ];
}

class ReportMediaEditReport extends Equatable {
  const ReportMediaEditReport({
    required this.reportId,
    required this.mediaPath,
    required this.updatedAt,
    required this.createdAt,
    required this.reportMediaId,
  });

  final int? reportId;
  final String? mediaPath;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? reportMediaId;

  Map<String, dynamic> toMap() {
    return {
      'report_id': reportId,
      'media_path': mediaPath,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'report_media_id': reportMediaId,
    };
  }

  factory ReportMediaEditReport.fromMap(Map<String, dynamic> map) {
    return ReportMediaEditReport(
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      mediaPath: map['media_path'],
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      reportMediaId: int.tryParse(map['report_media_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportMediaEditReport.fromJson(String source) =>
      ReportMediaEditReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        reportId,
        mediaPath,
        updatedAt,
        createdAt,
        reportMediaId,
      ];
}
