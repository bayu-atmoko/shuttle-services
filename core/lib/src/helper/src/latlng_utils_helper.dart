import 'dart:math';

import 'package:core/core.dart';

class LatLngUtilHelper {
  static String encodeLatLng(List<LatLng> data) {
    final listData = data.map((e) => Point(e.latitude, e.longitude)).toList();
    return PolyUtils.encode(listData);
  }

  static List<LatLng> decodeLatLng(String encodeData) {
    List<Point> list = PolyUtils.decode(encodeData);
    return list.map((e) => LatLng((e.x).toDouble(), e.y.toDouble())).toList();
  }
}
