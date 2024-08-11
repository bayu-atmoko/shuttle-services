import 'dart:convert';

import 'package:assets/src/district/src/district.dart';
import 'package:flutter/services.dart';

class RegionHelper {
  static const String _assets = 'packages/assets/assets/json';
  static const String bandungDistrictJson = "$_assets/bandung_district.json";

  static Future<List<District>> getBandungDistrictData() async {
    final String jsonString = await rootBundle.loadString(bandungDistrictJson);
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;

    // Convert each JSON object to a District object
    return jsonList.map((json) => District.fromJson(json)).toList();
  }
}
