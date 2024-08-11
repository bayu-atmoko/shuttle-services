enum GenderEnum {
  male,
  female;

  String get title {
    switch (this) {
      case GenderEnum.male:
        return 'Laki-laki';
      case GenderEnum.female:
        return 'Perempuan';
      default:
        return '';
    }
  }

  String get value {
    switch (this) {
      case GenderEnum.male:
        return 'male';
      case GenderEnum.female:
        return 'female';
      default:
        return '';
    }
  }
}

class GenderEnumHelper {
  static GenderEnum? getEnumBasedOnTitle(String value) {
    switch (value) {
      case 'Laki-laki':
        return GenderEnum.male;
      case 'Perempuan':
        return GenderEnum.female;
      default:
        return null;
    }
  }

  static GenderEnum? getEnumBasedOnValue(String value) {
    switch (value) {
      case 'male':
        return GenderEnum.male;
      case 'female':
        return GenderEnum.female;
      default:
        return null;
    }
  }
}
