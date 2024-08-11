import 'dart:io';

import 'package:core/core.dart';

/// general callback
typedef IntCallback = Function(int value);
typedef DoubleCallback = Function(double value);
typedef StringCallback = Function(String value);
typedef ColorCallback = Function(Color value);
typedef BoolCallback = Function(bool value);
typedef FileCallback = Function(XFile? value);
typedef FilePdfCallback = Function(File? value);
typedef FilePdfNameFileCallback = Function(File? value, String? nameValue);
typedef StringListCallback = Function(List<String> value);
typedef MapCallback = Function(Map<dynamic, dynamic> value);
typedef DateCallback = Function(DateTime value);
typedef PermissionCallback = Function(PermissionStatus value);
typedef PermissionListCallback = Function(List<PermissionStatus> value);
