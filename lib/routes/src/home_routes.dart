import 'package:core/core.dart';
import 'package:home/detail_report/presentation/pages/detail_report_page.dart';
import 'package:home/home/presentation/pages/home_page.dart';
import 'package:home/create_report/presentation/pages/create_report_page.dart';
import 'package:route/detail_maps/presentation/pages/detail_maps_page.dart';
import 'package:route/maps_place_picker/presentation/pages/google_maps_place_picker_page.dart';

List<StatefulShellBranch> homeRoutes = [
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: PathRoutes.home,
        builder: (context, state) {
          final userRole = state.extra != null && state.extra is String
              ? state.extra as String
              : null;
          return HomePage(userRole: userRole.orEmpty());
        },
        routes: [
          GoRoute(
            path: MorphemeRoutes.createReport,
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => const CreateReportPage(),
            routes: [
              GoRoute(
                path: MorphemeRoutes.mapsPlacePicker,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final pageParams = state.extra as ExtraPlacePicker;
                  return MapsPlacePickerPage(
                    pageParams: pageParams,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: MorphemeRoutes.detailReport,
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              final reportId = state.extra != null && state.extra is String
                  ? state.extra as String
                  : '';
              return DetailReportPage(reportId: reportId);
            },
            routes: [
              GoRoute(
                path: MorphemeRoutes.createReport,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final editReportData = state.extra as ExtraEditReport?;
                  return CreateReportPage(editReportData: editReportData);
                },
              ),
              GoRoute(
                path: MorphemeRoutes.detailMaps,
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final locationLatLng =
                      state.extra != null && state.extra is LatLng
                          ? state.extra as LatLng
                          : null;
                  return DetailMapsPage(locationLatLng: locationLatLng);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
