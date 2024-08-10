import 'package:core/core.dart';
import 'package:route/map/presentation/pages/map_page.dart';
import 'package:route/maps_place_picker/presentation/pages/google_maps_place_picker_page.dart';

List<RouteBase> routePageRoutes = [
  GoRoute(
    path: joinRoutes([MorphemeRoutes.mapsPlacePicker]),
    // parentNavigatorKey: rootNavigatorKey,
    builder: (context, state) {
      return const MapsPlacePickerPage(pageParams: null);
    },
    // routes: [
    //   GoRoute(
    //     path: MorphemeRoutes.map,
    //     parentNavigatorKey: rootNavigatorKey,
    //     builder: (context, state) {
    //       final pageParams = state.extra as ExtraPlacePicker;
    //       return MapPage(
    //         pageParams: pageParams,
    //       );
    //     },
    //   ),
    // ],
  ),
];
