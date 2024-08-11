import 'package:core/src/global_variable.dart';
import 'package:core/src/shared/extras/extras.dart';
import 'package:dependency_manager/dependency_manager.dart'
    show GoRouter, GoRouterHelper, LatLng;
import 'package:flutter/material.dart' show BuildContext;

String joinRoutes(List<String> paths) {
  if (paths.isEmpty) {
    return '/';
  } else if (paths[0].startsWith('/')) {
    return paths.join('/');
  } else {
    return '/${paths.join('/')}';
  }
}

String dynamicRoutes(String nextRoutes) {
  final goRouter = locator<GoRouter>();
  Uri uri = goRouter.routerDelegate.currentConfiguration.uri;
  uri = uri.replace(
    path: joinRoutes([uri.path, nextRoutes]),
    queryParameters: {},
  );
  return uri.toString();
}

abstract final class MorphemeRoutes {
  static const String splash = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';

  static const String main = 'main';
  static const String home = 'home';
  static const String help = 'help';
  static const String map = 'map';
  static const String profile = 'profile';

  static const String createReport = 'create-report';
  static const String detailReport = 'detail-report';
  static const String detailMaps = 'detail-maps';
  static const String mapsPlacePicker = 'maps-place-picker';

  static const String changePassword = 'change-password';
  static const String editProfile = 'edit-profile';

  static const String detailRoute = 'detail-route';
}

abstract final class PathRoutes {
  static String get login => joinRoutes([MorphemeRoutes.login]);
  static String get register => dynamicRoutes(MorphemeRoutes.register);
  static String get forgotPassword =>
      dynamicRoutes(MorphemeRoutes.forgotPassword);

  static String get home => joinRoutes([MorphemeRoutes.home]);
  static String get help => joinRoutes([MorphemeRoutes.help]);
  static String get map => joinRoutes([MorphemeRoutes.map]);
  static String get profile => joinRoutes([MorphemeRoutes.profile]);

  static String get createReport => dynamicRoutes(MorphemeRoutes.createReport);
  static String get detailReport =>
      joinRoutes([home, MorphemeRoutes.detailReport]);
  static String get editReport =>
      joinRoutes([detailReport, MorphemeRoutes.createReport]);
  static String get detailMaps =>
      joinRoutes([detailReport, MorphemeRoutes.detailMaps]);
  static String get mapsPlacePicker => joinRoutes([
        home,
        MorphemeRoutes.createReport,
        MorphemeRoutes.mapsPlacePicker,
      ]);

  static String get changePassword =>
      joinRoutes([profile, MorphemeRoutes.changePassword]);
  static String get editProfile =>
      joinRoutes([profile, MorphemeRoutes.editProfile]);

  static String get detailRoute =>
      joinRoutes([map, MorphemeRoutes.detailRoute]);
}

extension MorphemeRoutesContextExtension on BuildContext {
  void goToLogin() => go(PathRoutes.login);
  void goToRegister() => go(PathRoutes.register);
  void goToForgotPassword() => go(PathRoutes.forgotPassword);

  void goToHome(String userRole) => go(
        PathRoutes.home,
        extra: userRole,
      );
  void goToMap() => go(PathRoutes.map);
  void goToProfile() => go(PathRoutes.profile);

  Future<bool?> goToDetailReport(String reportId) => push(
        PathRoutes.detailReport,
        extra: reportId,
      );
  Future<ExtraPlacePicker?> goToMapsPlacePicker(ExtraPlacePicker pageParams) =>
      push(
        PathRoutes.mapsPlacePicker,
        extra: pageParams,
      );
  Future<bool?> goToCreateReport() => push(PathRoutes.createReport);
  Future<bool?> goToEditReport(ExtraEditReport? report) => push(
        PathRoutes.editReport,
        extra: report,
      );
  void goToDetailMaps(LatLng locationLatLng) => push(
        PathRoutes.detailMaps,
        extra: locationLatLng,
      );

  void goToChangePassword() => go(PathRoutes.changePassword);
  Future<bool?> goToEditProfile(ExtraUser? profile) => push(
        PathRoutes.editProfile,
        extra: profile,
      );

  void goToDetailRoute(String routeId) => go(
        PathRoutes.detailRoute,
        extra: routeId,
      );
}
