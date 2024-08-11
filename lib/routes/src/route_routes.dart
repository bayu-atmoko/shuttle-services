import 'package:core/core.dart';
import 'package:route/detail_route/presentation/pages/detail_route_page.dart';
import 'package:route/map/presentation/pages/map_page.dart';

List<StatefulShellBranch> routePageRoutes = [
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: PathRoutes.map,
        builder: (context, state) => const MapPage(),
        routes: [
          GoRoute(
            path: MorphemeRoutes.detailRoute,
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              final routeId = state.extra != null && state.extra is String
                  ? state.extra as String
                  : '';
              return DetailRoutePage(routeId: routeId);
            },
          ),
        ],
      ),
    ],
  ),
];
