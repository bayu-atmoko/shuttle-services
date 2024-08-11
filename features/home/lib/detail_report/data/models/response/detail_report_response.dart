import 'dart:convert';

import 'package:core/core.dart';

class DetailReportResponse extends Equatable {
  const DetailReportResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataDetailReport? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory DetailReportResponse.fromMap(Map<String, dynamic> map) {
    return DetailReportResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataDetailReport.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailReportResponse.fromJson(String source) =>
      DetailReportResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataDetailReport extends Equatable {
  const DataDetailReport({
    required this.report,
    required this.reportMedia,
    required this.garbagePhotoCleaned,
    required this.location,
  });

  final ReportDetailReport? report;
  final List<ReportMediaDetailReport>? reportMedia;
  final List<GarbagePhotoCleanedDetailReport>? garbagePhotoCleaned;
  final LocationDetailReport? location;

  Map<String, dynamic> toMap() {
    return {
      'report': report?.toMap(),
      'report_media': reportMedia?.map((e) => e.toMap()).toList(),
      'garbage_photo_cleaned':
          garbagePhotoCleaned?.map((e) => e.toMap()).toList(),
      'location': location?.toMap(),
    };
  }

  factory DataDetailReport.fromMap(Map<String, dynamic> map) {
    return DataDetailReport(
      report: map['report'] == null
          ? null
          : ReportDetailReport.fromMap(map['report']),
      reportMedia: map['report_media'] == null
          ? null
          : List.from((map['report_media'] as List)
              .map((e) => ReportMediaDetailReport.fromMap(e))),
      garbagePhotoCleaned: map['garbage_photo_cleaned'] == null
          ? null
          : List.from((map['garbage_photo_cleaned'] as List)
              .map((e) => GarbagePhotoCleanedDetailReport.fromMap(e))),
      location: map['location'] == null
          ? null
          : LocationDetailReport.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataDetailReport.fromJson(String source) =>
      DataDetailReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        report,
        reportMedia,
        garbagePhotoCleaned,
        location,
      ];
}

class ReportDetailReport extends Equatable {
  const ReportDetailReport({
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
    required this.priority,
    required this.cancellationReason,
    required this.deletedAt,
    required this.officerName,
    required this.creatorName,
    required this.creatorPhone,
    required this.complaintTitle,
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
  final DateTime? finishedAt;
  final int? priority;
  final String? cancellationReason;
  final DateTime? deletedAt;
  final String? officerName;
  final String? creatorName;
  final String? creatorPhone;
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
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'finished_at': finishedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'priority': priority,
      'cancellation_reason': cancellationReason,
      'deleted_at': deletedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'officer_name': officerName,
      'creator_name': creatorName,
      'creator_phone': creatorPhone,
      'complaint_title': complaintTitle,
    };
  }

  factory ReportDetailReport.fromMap(Map<String, dynamic> map) {
    return ReportDetailReport(
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      creatorId: int.tryParse(map['creator_id']?.toString() ?? ''),
      officerId: int.tryParse(map['officer_id']?.toString() ?? ''),
      status: map['status'],
      description: map['description'],
      complaintId: int.tryParse(map['complaint_id']?.toString() ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      finishedAt: DateTime.tryParse(map['finished_at'] ?? ''),
      priority: int.tryParse(map['priority']?.toString() ?? ''),
      cancellationReason: map['cancellation_reason'],
      deletedAt: DateTime.tryParse(map['deleted_at'] ?? ''),
      officerName: map['officer_name'],
      creatorName: map['creator_name'],
      creatorPhone: map['creator_phone'],
      complaintTitle: map['complaint_title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportDetailReport.fromJson(String source) =>
      ReportDetailReport.fromMap(json.decode(source));

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
        priority,
        cancellationReason,
        deletedAt,
        officerName,
        creatorName,
        creatorPhone,
        complaintTitle,
      ];
}

class LocationDetailReport extends Equatable {
  const LocationDetailReport({
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
  final DateTime? deletedAt;
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
      'deleted_at': deletedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'district': district,
      'village': village,
    };
  }

  factory LocationDetailReport.fromMap(Map<String, dynamic> map) {
    return LocationDetailReport(
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      name: map['name'],
      address: map['address'],
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(map['deleted_at'] ?? ''),
      district: map['district'],
      village: map['village'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationDetailReport.fromJson(String source) =>
      LocationDetailReport.fromMap(json.decode(source));

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

class ReportMediaDetailReport extends Equatable {
  const ReportMediaDetailReport({
    required this.reportMediaId,
    required this.reportId,
    required this.type,
    required this.mediaPath,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int? reportMediaId;
  final int? reportId;
  final String? type;
  final String? mediaPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Map<String, dynamic> toMap() {
    return {
      'report_media_id': reportMediaId,
      'report_id': reportId,
      'type': type,
      'media_path': mediaPath,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
    };
  }

  factory ReportMediaDetailReport.fromMap(Map<String, dynamic> map) {
    return ReportMediaDetailReport(
      reportMediaId: int.tryParse(map['report_media_id']?.toString() ?? ''),
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      type: map['type'],
      mediaPath: map['media_path'],
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(map['deleted_at'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportMediaDetailReport.fromJson(String source) =>
      ReportMediaDetailReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        reportMediaId,
        reportId,
        type,
        mediaPath,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}

class GarbagePhotoCleanedDetailReport extends Equatable {
  const GarbagePhotoCleanedDetailReport({
    required this.reportMediaId,
    required this.reportId,
    required this.type,
    required this.mediaPath,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int? reportMediaId;
  final int? reportId;
  final String? type;
  final String? mediaPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Map<String, dynamic> toMap() {
    return {
      'report_media_id': reportMediaId,
      'report_id': reportId,
      'type': type,
      'media_path': mediaPath,
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'deleted_at': deletedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
    };
  }

  factory GarbagePhotoCleanedDetailReport.fromMap(Map<String, dynamic> map) {
    return GarbagePhotoCleanedDetailReport(
      reportMediaId: int.tryParse(map['report_media_id']?.toString() ?? ''),
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      type: map['type'],
      mediaPath: map['media_path'],
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(map['deleted_at'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory GarbagePhotoCleanedDetailReport.fromJson(String source) =>
      GarbagePhotoCleanedDetailReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        reportMediaId,
        reportId,
        type,
        mediaPath,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
