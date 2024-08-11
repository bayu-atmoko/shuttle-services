enum ReportPriorityEnum {
  veryHighPriority,
  highPriority,
  mediumPriority,
  lowPriority,
  veryLowPriority;

  String get title {
    switch (this) {
      case ReportPriorityEnum.veryHighPriority:
        return 'Sangat Prioritas (5)';
      case ReportPriorityEnum.highPriority:
        return 'Prioritas Tinggi (4)';
      case ReportPriorityEnum.mediumPriority:
        return 'Prioritas Sedang (3)';
      case ReportPriorityEnum.lowPriority:
        return 'Prioritas Rendah (2)';
      case ReportPriorityEnum.veryLowPriority:
        return 'Sangat Tidak Prioritas (1)';
      default:
        return '';
    }
  }

  int get value {
    switch (this) {
      case ReportPriorityEnum.veryHighPriority:
        return 5;
      case ReportPriorityEnum.highPriority:
        return 4;
      case ReportPriorityEnum.mediumPriority:
        return 3;
      case ReportPriorityEnum.lowPriority:
        return 2;
      case ReportPriorityEnum.veryLowPriority:
        return 1;
      default:
        return 3;
    }
  }
}

class ReportPriorityEnumHelper {
  static ReportPriorityEnum? getEnumBasedOnTitle(String value) {
    switch (value) {
      case 'Sangat Prioritas (5)':
        return ReportPriorityEnum.veryHighPriority;
      case 'Prioritas Tinggi (4)':
        return ReportPriorityEnum.highPriority;
      case 'Prioritas Sedang (3)':
        return ReportPriorityEnum.mediumPriority;
      case 'Prioritas Rendah (2)':
        return ReportPriorityEnum.lowPriority;
      case 'Sangat Tidak Prioritas (1)':
        return ReportPriorityEnum.veryLowPriority;
      default:
        return null;
    }
  }

  static ReportPriorityEnum? getEnumBasedOnValue(int value) {
    switch (value) {
      case 5:
        return ReportPriorityEnum.veryHighPriority;
      case 4:
        return ReportPriorityEnum.highPriority;
      case 3:
        return ReportPriorityEnum.mediumPriority;
      case 2:
        return ReportPriorityEnum.lowPriority;
      case 1:
        return ReportPriorityEnum.veryLowPriority;
      default:
        return null;
    }
  }
}
