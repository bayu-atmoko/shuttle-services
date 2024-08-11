import 'data/models/response/list_report_response.dart' as list_report_response;
import 'domain/entities/list_report_entity.dart' as list_report_entity;

extension ListReportResponseMapper on list_report_response.ListReportResponse {
  list_report_entity.ListReportEntity toEntity() =>
      list_report_entity.ListReportEntity(
        success: success,
        message: message,
        data: data?.toEntity(),
      );
}

extension ListReportEntityMapper on list_report_entity.ListReportEntity {
  list_report_response.ListReportResponse toResponse() =>
      list_report_response.ListReportResponse(
        success: success,
        message: message,
        data: data?.toResponse(),
      );
}

extension DataListReportResponseMapper on list_report_response.DataListReport {
  list_report_entity.DataListReport toEntity() =>
      list_report_entity.DataListReport(
        data: data?.map((e) => e.toEntity()).toList(),
        total: total,
        perPage: perPage,
        currentPage: currentPage,
        lastPage: lastPage,
      );
}

extension DataListReportEntityMapper on list_report_entity.DataListReport {
  list_report_response.DataListReport toResponse() =>
      list_report_response.DataListReport(
        data: data?.map((e) => e.toResponse()).toList(),
        total: total,
        perPage: perPage,
        currentPage: currentPage,
        lastPage: lastPage,
      );
}

extension AlphaDataListReportResponseMapper
    on list_report_response.AlphaDataListReport {
  list_report_entity.AlphaDataListReport toEntity() =>
      list_report_entity.AlphaDataListReport(
        reportId: reportId,
        creatorId: creatorId,
        officerId: officerId,
        status: status,
        description: description,
        complaintId: complaintId,
        locationId: locationId,
        routeId: routeId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        finishedAt: finishedAt,
        priority: priority,
        cancellationReason: cancellationReason,
        deletedAt: deletedAt,
        locationName: locationName,
        locationAddress: locationAddress,
        locationLatitude: locationLatitude,
        locationLongitude: locationLongitude,
        officerName: officerName,
        creatorName: creatorName,
        complaintTitle: complaintTitle,
      );
}

extension AlphaDataListReportEntityMapper
    on list_report_entity.AlphaDataListReport {
  list_report_response.AlphaDataListReport toResponse() =>
      list_report_response.AlphaDataListReport(
        reportId: reportId,
        creatorId: creatorId,
        officerId: officerId,
        status: status,
        description: description,
        complaintId: complaintId,
        locationId: locationId,
        routeId: routeId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        finishedAt: finishedAt,
        priority: priority,
        cancellationReason: cancellationReason,
        deletedAt: deletedAt,
        locationName: locationName,
        locationAddress: locationAddress,
        locationLatitude: locationLatitude,
        locationLongitude: locationLongitude,
        officerName: officerName,
        creatorName: creatorName,
        complaintTitle: complaintTitle,
      );
}
