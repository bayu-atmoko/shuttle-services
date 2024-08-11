import 'package:core/core.dart';

import 'data/models/response/detail_report_response.dart'
    as detail_report_response;
import 'domain/entities/detail_report_entity.dart' as detail_report_entity;
import 'data/models/response/delete_report_response.dart'
    as delete_report_response;
import 'domain/entities/delete_report_entity.dart' as delete_report_entity;

extension DetailReportResponseMapper
    on detail_report_response.DetailReportResponse {
  detail_report_entity.DetailReportEntity toEntity() =>
      detail_report_entity.DetailReportEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension DetailReportEntityMapper on detail_report_entity.DetailReportEntity {
  detail_report_response.DetailReportResponse toResponse() =>
      detail_report_response.DetailReportResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataDetailReportResponseMapper
    on detail_report_response.DataDetailReport {
  detail_report_entity.DataDetailReport toEntity() =>
      detail_report_entity.DataDetailReport(
        report: report?.toEntity(),
        reportMedia: reportMedia?.map((e) => e.toEntity()).toList(),
        garbagePhotoCleaned:
            garbagePhotoCleaned?.map((e) => e.toEntity()).toList(),
        location: location?.toEntity(),
      );
}

extension DataDetailReportEntityMapper
    on detail_report_entity.DataDetailReport {
  detail_report_response.DataDetailReport toResponse() =>
      detail_report_response.DataDetailReport(
        report: report?.toResponse(),
        reportMedia: reportMedia?.map((e) => e.toResponse()).toList(),
        garbagePhotoCleaned:
            garbagePhotoCleaned?.map((e) => e.toResponse()).toList(),
        location: location?.toResponse(),
      );
}

extension ReportDetailReportResponseMapper
    on detail_report_response.ReportDetailReport {
  detail_report_entity.ReportDetailReport toEntity() =>
      detail_report_entity.ReportDetailReport(
        reportId: reportId,
        creatorId: creatorId,
        officerId: officerId,
        status: status,
        description: description,
        complaintId: complaintId,
        locationId: locationId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        finishedAt: finishedAt,
        priority: priority,
        cancellationReason: cancellationReason,
        deletedAt: deletedAt,
        officerName: officerName,
        creatorName: creatorName,
        creatorPhone: creatorPhone,
        complaintTitle: complaintTitle,
      );
}

extension ReportDetailReportEntityMapper
    on detail_report_entity.ReportDetailReport {
  detail_report_response.ReportDetailReport toResponse() =>
      detail_report_response.ReportDetailReport(
        reportId: reportId,
        creatorId: creatorId,
        officerId: officerId,
        status: status,
        description: description,
        complaintId: complaintId,
        locationId: locationId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        finishedAt: finishedAt,
        priority: priority,
        cancellationReason: cancellationReason,
        deletedAt: deletedAt,
        officerName: officerName,
        creatorName: creatorName,
        creatorPhone: creatorPhone,
        complaintTitle: complaintTitle,
      );
}

extension ExtraEditReportMapper on detail_report_entity.ReportDetailReport {
  ExtraEditReport toPageParams() => ExtraEditReport(
        reportId: reportId,
        status: status,
        description: description,
        complaintId: complaintId,
        location: null,
        media: null,
      );
}

extension ExtraEditLocationMapper on detail_report_entity.LocationDetailReport {
  ExtraEditLocation toPageParams() => ExtraEditLocation(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        district: district,
        village: village,
      );
}

extension ExtraEditMediaMapper on detail_report_entity.ReportMediaDetailReport {
  ExtraEditMedia toPageParams() => ExtraEditMedia(
        reportMediaId: reportMediaId,
        reportId: reportId,
        mediaPath: mediaPath,
      );
}

extension LocationDetailReportResponseMapper
    on detail_report_response.LocationDetailReport {
  detail_report_entity.LocationDetailReport toEntity() =>
      detail_report_entity.LocationDetailReport(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension LocationDetailReportEntityMapper
    on detail_report_entity.LocationDetailReport {
  detail_report_response.LocationDetailReport toResponse() =>
      detail_report_response.LocationDetailReport(
        locationId: locationId,
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
        district: district,
        village: village,
      );
}

extension ReportMediaDetailReportResponseMapper
    on detail_report_response.ReportMediaDetailReport {
  detail_report_entity.ReportMediaDetailReport toEntity() =>
      detail_report_entity.ReportMediaDetailReport(
        reportMediaId: reportMediaId,
        reportId: reportId,
        type: type,
        mediaPath: mediaPath,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
}

extension ReportMediaDetailReportEntityMapper
    on detail_report_entity.ReportMediaDetailReport {
  detail_report_response.ReportMediaDetailReport toResponse() =>
      detail_report_response.ReportMediaDetailReport(
        reportMediaId: reportMediaId,
        reportId: reportId,
        type: type,
        mediaPath: mediaPath,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
}

extension GarbagePhotoCleanedDetailReportResponseMapper
    on detail_report_response.GarbagePhotoCleanedDetailReport {
  detail_report_entity.GarbagePhotoCleanedDetailReport toEntity() =>
      detail_report_entity.GarbagePhotoCleanedDetailReport(
        reportMediaId: reportMediaId,
        reportId: reportId,
        type: type,
        mediaPath: mediaPath,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
}

extension GarbagePhotoCleanedDetailReportEntityMapper
    on detail_report_entity.GarbagePhotoCleanedDetailReport {
  detail_report_response.GarbagePhotoCleanedDetailReport toResponse() =>
      detail_report_response.GarbagePhotoCleanedDetailReport(
        reportMediaId: reportMediaId,
        reportId: reportId,
        type: type,
        mediaPath: mediaPath,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
}

extension DeleteReportResponseMapper
    on delete_report_response.DeleteReportResponse {
  delete_report_entity.DeleteReportEntity toEntity() =>
      delete_report_entity.DeleteReportEntity(
        success: success,
        message: message,
        data: data,
      );
}

extension DeleteReportEntityMapper on delete_report_entity.DeleteReportEntity {
  delete_report_response.DeleteReportResponse toResponse() =>
      delete_report_response.DeleteReportResponse(
        success: success,
        message: message,
        data: data,
      );
}
