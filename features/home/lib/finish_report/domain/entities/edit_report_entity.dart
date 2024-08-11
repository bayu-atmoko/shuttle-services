import 'package:core/core.dart';

class EditReportEntity extends Equatable {
  const EditReportEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataEditReport? data;

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

  @override
  List<Object?> get props => [
        reportId,
        mediaPath,
        updatedAt,
        createdAt,
        reportMediaId,
      ];
}
