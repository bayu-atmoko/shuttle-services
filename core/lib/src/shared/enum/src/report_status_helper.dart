import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ReportStatusHelper {
  static Status determineStatus(BuildContext context, String status) {
    if (status.toLowerCase() ==
        ReportStatusEnum.newReport.value.toLowerCase()) {
      return Status(
        title: ReportStatusEnum.newReport.title,
        color: context.color.orange700,
        background: context.color.orange25,
        icon: Icons.add_circle_outline,
      );
    } else if (status.toLowerCase() ==
        ReportStatusEnum.assigned.value.toLowerCase()) {
      return Status(
        title: ReportStatusEnum.assigned.title,
        color: context.color.purple700,
        background: context.color.purple25,
        icon: Icons.assignment_outlined,
      );
    } else if (status.toLowerCase() ==
        ReportStatusEnum.cleaned.value.toLowerCase()) {
      return Status(
        title: ReportStatusEnum.cleaned.title,
        color: context.color.primary700,
        background: context.color.primary100,
        icon: Icons.cleaning_services_outlined,
      );
    } else if (status.toLowerCase() ==
        ReportStatusEnum.finish.value.toLowerCase()) {
      return Status(
        title: ReportStatusEnum.finish.title,
        color: context.color.success700,
        background: context.color.success25,
        icon: Icons.check_circle_outline,
      );
    } else if (status.toLowerCase() ==
        ReportStatusEnum.cancel.value.toLowerCase()) {
      return Status(
        title: ReportStatusEnum.cancel.title,
        color: context.color.error700,
        background: context.color.error25,
        icon: Icons.cancel_outlined,
      );
    } else {
      return Status(
        title: ReportStatusEnum.newReport.title,
        color: context.color.orange700,
        background: context.color.orange25,
        icon: Icons.add_circle_outline,
      );
    }
  }
}
