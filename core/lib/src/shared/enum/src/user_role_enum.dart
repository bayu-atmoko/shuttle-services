enum UserRoleEnum {
  masyarakat,
  petugas,
  admin,
  reporter;

  String get value {
    switch (this) {
      case UserRoleEnum.masyarakat:
        return 'masyarakat';
      case UserRoleEnum.petugas:
        return 'petugas';
      case UserRoleEnum.admin:
        return 'admin';
      case UserRoleEnum.reporter:
        return 'reporter';
      default:
        return '';
    }
  }
}
