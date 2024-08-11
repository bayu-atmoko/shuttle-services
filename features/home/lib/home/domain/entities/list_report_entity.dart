import 'package:core/core.dart';

class ListReportEntity extends Equatable {
  const ListReportEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataListReport? data;

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
