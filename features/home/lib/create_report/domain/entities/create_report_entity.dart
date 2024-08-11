import 'package:core/core.dart';

class CreateReportEntity extends Equatable {
  const CreateReportEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataCreateReport? data;

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

  @override
  List<Object?> get props => [
        reportId,
        mediaPath,
        updatedAt,
        createdAt,
        reportMediaId,
      ];
}
