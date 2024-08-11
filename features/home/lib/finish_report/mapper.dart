import 'data/models/response/edit_report_response.dart' as edit_report_response;
import 'domain/entities/edit_report_entity.dart' as edit_report_entity;

extension EditReportResponseMapper on edit_report_response.EditReportResponse {
  edit_report_entity.EditReportEntity toEntity() =>
      edit_report_entity.EditReportEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension EditReportEntityMapper on edit_report_entity.EditReportEntity {
  edit_report_response.EditReportResponse toResponse() =>
      edit_report_response.EditReportResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataEditReportResponseMapper on edit_report_response.DataEditReport {
  edit_report_entity.DataEditReport toEntity() =>
      edit_report_entity.DataEditReport(
        report: report?.toEntity(),
        reportMedia: reportMedia?.map((e) => e.toEntity()).toList(),
        location: location?.toEntity(),
      );
}

extension DataEditReportEntityMapper on edit_report_entity.DataEditReport {
  edit_report_response.DataEditReport toResponse() =>
      edit_report_response.DataEditReport(
        report: report?.toResponse(),
        reportMedia: reportMedia?.map((e) => e.toResponse()).toList(),
        location: location?.toResponse(),
      );
}

extension ReportEditReportResponseMapper
    on edit_report_response.ReportEditReport {
  edit_report_entity.ReportEditReport toEntity() =>
      edit_report_entity.ReportEditReport(
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
        cancellationReason: cancellationReason,
        deletedAt: deletedAt,
      );
}

extension ReportEditReportEntityMapper on edit_report_entity.ReportEditReport {
  edit_report_response.ReportEditReport toResponse() =>
      edit_report_response.ReportEditReport(
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
        cancellationReason: cancellationReason,
        deletedAt: deletedAt,
      );
}

extension LocationEditReportResponseMapper
    on edit_report_response.LocationEditReport {
  edit_report_entity.LocationEditReport toEntity() =>
      edit_report_entity.LocationEditReport(
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

extension LocationEditReportEntityMapper
    on edit_report_entity.LocationEditReport {
  edit_report_response.LocationEditReport toResponse() =>
      edit_report_response.LocationEditReport(
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

extension ReportMediaEditReportResponseMapper
    on edit_report_response.ReportMediaEditReport {
  edit_report_entity.ReportMediaEditReport toEntity() =>
      edit_report_entity.ReportMediaEditReport(
        reportId: reportId,
        mediaPath: mediaPath,
        updatedAt: updatedAt,
        createdAt: createdAt,
        reportMediaId: reportMediaId,
      );
}

extension ReportMediaEditReportEntityMapper
    on edit_report_entity.ReportMediaEditReport {
  edit_report_response.ReportMediaEditReport toResponse() =>
      edit_report_response.ReportMediaEditReport(
        reportId: reportId,
        mediaPath: mediaPath,
        updatedAt: updatedAt,
        createdAt: createdAt,
        reportMediaId: reportMediaId,
      );
}
