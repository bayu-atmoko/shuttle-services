enum ReportStatusEnum {
  newReport,
  assigned,
  cleaned,
  finish,
  cancel;

  String get title {
    switch (this) {
      case ReportStatusEnum.newReport:
        return 'Baru';
      case ReportStatusEnum.assigned:
        return 'Ditugaskan';
      case ReportStatusEnum.cleaned:
        return 'Diantar';
      case ReportStatusEnum.finish:
        return 'Selesai';
      case ReportStatusEnum.cancel:
        return 'Batal';
      default:
        return '';
    }
  }

  String get value {
    switch (this) {
      case ReportStatusEnum.newReport:
        return 'baru';
      case ReportStatusEnum.assigned:
        return 'ditugaskan';
      case ReportStatusEnum.cleaned:
        return 'dibersihkan';
      case ReportStatusEnum.finish:
        return 'selesai';
      case ReportStatusEnum.cancel:
        return 'batal';
      default:
        return '';
    }
  }
}
