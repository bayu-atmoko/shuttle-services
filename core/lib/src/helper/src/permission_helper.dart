import 'dart:io';
import 'package:core/core.dart';

class PermissionHelper {
  static Future<bool> askLocationPermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return false;
    }
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static Future<bool> requestImagePickerPermission(
    ImageSource source,
    bool isTablet,
  ) async {
    bool granted = false;
    if (source == ImageSource.gallery) {
      final permission = await permissionStorage();
      granted = await requestSinglePermission(
        permission,
      );
    } else {
      granted = await requestSinglePermission(
        Permission.camera,
      );
    }
    return granted;
  }

  static Future<bool> requestSinglePermission(
    Permission permission,
  ) async {
    var status = await permission.status;

    /// If the user has not given the app permission to access certain resources,
    /// and the user has not selected the "Deny" option when asked for permission
    if (status.isDenied && Platform.isIOS) {
      try {
        /// show permission dialog from the default system
        permission.request();

        /// If the user has not agreed to the permission,
        /// then show the custom permission dialog
      } catch (_) {
        openAppSettings();
      }

      /// If the user has not agreed to the permission,
      /// then show the custom permission dialog
    } else if (!status.isGranted) {
      openAppSettings();
    }

    return status.isGranted;
  }

  static Future<Permission> permissionStorage() async {
    Permission permission = Permission.photos;
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final android = await deviceInfo.androidInfo;
      final sdk = android.version.sdkInt;
      if (sdk < 33) {
        permission = Permission.storage;
      }
    }

    return permission;
  }

  static Future<void> requestAllPermissions() async {
    final storagePermission = await permissionStorage();
    await storagePermission.request();
    await Permission.camera.request();
    await Permission.microphone.request();
  }

  /// If the user has not given the app permission to access certain resources,
  /// and the user has not selected the "Deny" option when asked for permission
  static Future<void> requestAgainAllPermissions() async {
    final storagePermission = await permissionStorage();
    var statusStorage = await storagePermission.status;
    if (statusStorage.isDenied) {
      await storagePermission.request();
    }

    const cameraPermission = Permission.camera;
    var statusCamera = await cameraPermission.status;
    if (statusCamera.isDenied) {
      await cameraPermission.request();
    }

    const microphonePermission = Permission.microphone;
    var statusMicrophone = await microphonePermission.status;
    if (statusMicrophone.isDenied) {
      await microphonePermission.request();
    }
  }
}
