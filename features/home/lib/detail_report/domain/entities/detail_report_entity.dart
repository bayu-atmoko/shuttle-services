import 'package:core/core.dart';

class DetailReportEntity extends Equatable {
  const DetailReportEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataDetailReport? data;

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
