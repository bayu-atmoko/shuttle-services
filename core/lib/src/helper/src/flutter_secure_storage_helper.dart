import 'package:dependency_manager/dependency_manager.dart'
    show FlutterSecureStorage;

import '../../global_variable.dart';

abstract final class KeyFlutterSecureStorage {
  static const String keyToken = 'token';
  static const String keyRememberMe = 'remember_me';
  static const String keyEmail = 'email';
  static const String keyRole = 'role';
  static const String keyPassword = 'password';
}

abstract final class FlutterSecureStorageHelper {
  static final _fss = locator<FlutterSecureStorage>();

  static Future<String?> getToken() =>
      _fss.read(key: KeyFlutterSecureStorage.keyToken);
  static Future<void> saveToken(String? token) =>
      _fss.write(key: KeyFlutterSecureStorage.keyToken, value: token);
  static Future<void> removeToken() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyToken);

  static Future<bool> isRememberMe() async {
    String? data = await _fss.read(key: KeyFlutterSecureStorage.keyRememberMe);
    return data != null ? data == 'true' : false;
  }

  static Future<void> saveRememberMe(bool? value) => _fss.write(
      key: KeyFlutterSecureStorage.keyRememberMe, value: value.toString());
  static Future<void> removeRememberMe() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyRememberMe);

  static Future<String?> getEmail() =>
      _fss.read(key: KeyFlutterSecureStorage.keyEmail);
  static Future<void> saveEmail(String? value) =>
      _fss.write(key: KeyFlutterSecureStorage.keyEmail, value: value);
  static Future<void> removeEmail() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyEmail);

  static Future<String?> getPassword() =>
      _fss.read(key: KeyFlutterSecureStorage.keyPassword);
  static Future<void> savePassword(String? value) =>
      _fss.write(key: KeyFlutterSecureStorage.keyPassword, value: value);
  static Future<void> removePassword() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyPassword);

  static Future<String?> getRole() =>
      _fss.read(key: KeyFlutterSecureStorage.keyRole);
  static Future<void> saveRole(String? value) =>
      _fss.write(key: KeyFlutterSecureStorage.keyRole, value: value);
  static Future<void> removeRole() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyRole);
}
