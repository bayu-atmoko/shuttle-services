import 'dart:convert';

import 'package:core/core.dart';

class CreateReportResponse extends Equatable {
  const CreateReportResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataCreateReport? data;

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory CreateReportResponse.fromMap(Map<String, dynamic> map) {
    return CreateReportResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'] == null ? null : DataCreateReport.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateReportResponse.fromJson(String source) =>
      CreateReportResponse.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataCreateReport extends Equatable {
  const DataCreateReport({
    required this.report,
    required this.reportMedia,
    required this.location,
  });

  final ReportCreateReport? report;
  final List<ReportMediaCreateReport>? reportMedia;
  final LocationCreateReport? location;

  Map<String, dynamic> toMap() {
    return {
      'report': report?.toMap(),
      'report_media': reportMedia?.map((e) => e.toMap()).toList(),
      'location': location?.toMap(),
    };
  }

  factory DataCreateReport.fromMap(Map<String, dynamic> map) {
    return DataCreateReport(
      report: map['report'] == null
          ? null
          : ReportCreateReport.fromMap(map['report']),
      reportMedia: map['report_media'] == null
          ? null
          : List.from((map['report_media'] as List)
              .map((e) => ReportMediaCreateReport.fromMap(e))),
      location: map['location'] == null
          ? null
          : LocationCreateReport.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataCreateReport.fromJson(String source) =>
      DataCreateReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        report,
        reportMedia,
        location,
      ];
}

class ReportCreateReport extends Equatable {
  const ReportCreateReport({
    required this.description,
    required this.complaintId,
    required this.locationId,
    required this.creatorId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.reportId,
  });

  final String? description;
  final int? complaintId;
  final int? locationId;
  final int? creatorId;
  final String? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? reportId;

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'complaint_id': complaintId,
      'location_id': locationId,
      'creator_id': creatorId,
      'status': status,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'report_id': reportId,
    };
  }

  factory ReportCreateReport.fromMap(Map<String, dynamic> map) {
    return ReportCreateReport(
      description: map['description'],
      complaintId: int.tryParse(map['complaint_id']?.toString() ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
      creatorId: int.tryParse(map['creator_id']?.toString() ?? ''),
      status: map['status'],
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportCreateReport.fromJson(String source) =>
      ReportCreateReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        description,
        complaintId,
        locationId,
        creatorId,
        status,
        updatedAt,
        createdAt,
        reportId,
      ];
}

class LocationCreateReport extends Equatable {
  const LocationCreateReport({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.district,
    required this.village,
    required this.updatedAt,
    required this.createdAt,
    required this.locationId,
  });

  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? district;
  final String? village;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? locationId;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'district': district,
      'village': village,
      'updated_at': updatedAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'created_at': createdAt?.toFormatDateTimeResponse('yyyy-MM-dd HH:mm'),
      'location_id': locationId,
    };
  }

  factory LocationCreateReport.fromMap(Map<String, dynamic> map) {
    return LocationCreateReport(
      name: map['name'],
      address: map['address'],
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
      district: map['district'],
      village: map['village'],
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      locationId: int.tryParse(map['location_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationCreateReport.fromJson(String source) =>
      LocationCreateReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        name,
        address,
        latitude,
        longitude,
        district,
        village,
        updatedAt,
        createdAt,
        locationId,
      ];
}

class ReportMediaCreateReport extends Equatable {
  const ReportMediaCreateReport({
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

  factory ReportMediaCreateReport.fromMap(Map<String, dynamic> map) {
    return ReportMediaCreateReport(
      reportId: int.tryParse(map['report_id']?.toString() ?? ''),
      mediaPath: map['media_path'],
      updatedAt: DateTime.tryParse(map['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(map['created_at'] ?? ''),
      reportMediaId: int.tryParse(map['report_media_id']?.toString() ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportMediaCreateReport.fromJson(String source) =>
      ReportMediaCreateReport.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        reportId,
        mediaPath,
        updatedAt,
        createdAt,
        reportMediaId,
      ];
}
