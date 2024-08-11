import 'data/models/response/complaint_response.dart' as complaint_response;
import 'domain/entities/complaint_entity.dart' as complaint_entity;
import 'data/models/response/create_report_response.dart'
    as create_report_response;
import 'domain/entities/create_report_entity.dart' as create_report_entity;

extension ComplaintResponseMapper on complaint_response.ComplaintResponse {
  complaint_entity.ComplaintEntity toEntity() =>
      complaint_entity.ComplaintEntity(
        success: success,
        message: message,
        data: data?.map((e) => e.toEntity()).toList(),
      );
}

extension ComplaintEntityMapper on complaint_entity.ComplaintEntity {
  complaint_response.ComplaintResponse toResponse() =>
      complaint_response.ComplaintResponse(
        success: success,
        message: message,
        data: data?.map((e) => e.toResponse()).toList(),
      );
}

extension DataComplaintResponseMapper on complaint_response.DataComplaint {
  complaint_entity.DataComplaint toEntity() => complaint_entity.DataComplaint(
        complaintId: complaintId,
        title: title,
        complaintType: complaintType,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension DataComplaintEntityMapper on complaint_entity.DataComplaint {
  complaint_response.DataComplaint toResponse() =>
      complaint_response.DataComplaint(
        complaintId: complaintId,
        title: title,
        complaintType: complaintType,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension CreateReportResponseMapper
    on create_report_response.CreateReportResponse {
  create_report_entity.CreateReportEntity toEntity() =>
      create_report_entity.CreateReportEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension CreateReportEntityMapper on create_report_entity.CreateReportEntity {
  create_report_response.CreateReportResponse toResponse() =>
      create_report_response.CreateReportResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataCreateReportResponseMapper
    on create_report_response.DataCreateReport {
  create_report_entity.DataCreateReport toEntity() =>
      create_report_entity.DataCreateReport(
        report: report?.toEntity(),
        reportMedia: reportMedia?.map((e) => e.toEntity()).toList(),
        location: location?.toEntity(),
      );
}

extension DataCreateReportEntityMapper
    on create_report_entity.DataCreateReport {
  create_report_response.DataCreateReport toResponse() =>
      create_report_response.DataCreateReport(
        report: report?.toResponse(),
        reportMedia: reportMedia?.map((e) => e.toResponse()).toList(),
        location: location?.toResponse(),
      );
}

extension ReportCreateReportResponseMapper
    on create_report_response.ReportCreateReport {
  create_report_entity.ReportCreateReport toEntity() =>
      create_report_entity.ReportCreateReport(
        description: description,
        complaintId: complaintId,
        locationId: locationId,
        creatorId: creatorId,
        status: status,
        updatedAt: updatedAt,
        createdAt: createdAt,
        reportId: reportId,
      );
}

extension ReportCreateReportEntityMapper
    on create_report_entity.ReportCreateReport {
  create_report_response.ReportCreateReport toResponse() =>
      create_report_response.ReportCreateReport(
        description: description,
        complaintId: complaintId,
        locationId: locationId,
        creatorId: creatorId,
        status: status,
        updatedAt: updatedAt,
        createdAt: createdAt,
        reportId: reportId,
      );
}

extension LocationCreateReportResponseMapper
    on create_report_response.LocationCreateReport {
  create_report_entity.LocationCreateReport toEntity() =>
      create_report_entity.LocationCreateReport(
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        district: district,
        village: village,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension LocationCreateReportEntityMapper
    on create_report_entity.LocationCreateReport {
  create_report_response.LocationCreateReport toResponse() =>
      create_report_response.LocationCreateReport(
        name: name,
        address: address,
        latitude: latitude,
        longitude: longitude,
        district: district,
        village: village,
        updatedAt: updatedAt,
        createdAt: createdAt,
        locationId: locationId,
      );
}

extension ReportMediaCreateReportResponseMapper
    on create_report_response.ReportMediaCreateReport {
  create_report_entity.ReportMediaCreateReport toEntity() =>
      create_report_entity.ReportMediaCreateReport(
        reportId: reportId,
        mediaPath: mediaPath,
        updatedAt: updatedAt,
        createdAt: createdAt,
        reportMediaId: reportMediaId,
      );
}

extension ReportMediaCreateReportEntityMapper
    on create_report_entity.ReportMediaCreateReport {
  create_report_response.ReportMediaCreateReport toResponse() =>
      create_report_response.ReportMediaCreateReport(
        reportId: reportId,
        mediaPath: mediaPath,
        updatedAt: updatedAt,
        createdAt: createdAt,
        reportMediaId: reportMediaId,
      );
}
