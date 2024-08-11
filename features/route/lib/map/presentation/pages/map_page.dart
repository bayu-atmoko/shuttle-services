import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home/data/models/body/list_report_body.dart';
import 'package:route/map/presentation/widgets/google_maps_section.dart';
import 'package:route/map/presentation/widgets/maps_button.dart';

import '../cubit/map_cubit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with MorphemeStatePage<MapPage, MapCubit> {
  @override
  MapCubit setCubit() => locator<MapCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final routeId = context.select((MapCubit element) => element.state).routeId;

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.recommendationRoute,
      titleSpacing: MorphemeSizes.s16,
      isScroll: false,
      actionsAppBar: _headerButtonWidget(context),
      child: Stack(
        children: [
          const GoogleMapsSection(),

          /// right button
          Positioned(
            bottom: MorphemeSizes.marginPage,
            right: MorphemeSizes.marginPage,
            child: Column(
              children: [
                MapsButton(
                  icon: Icons.format_list_bulleted,
                  onTap: () {
                    if (routeId != null) {
                      context.goToDetailRoute(routeId.toString());
                    } else {
                      context.showSnackBar(
                        MorphemeSnackBar.error(
                          key: const ValueKey('snackbarError'),
                          context: context,
                          message: context.s.youDontHaveRoute,
                        ),
                      );
                    }
                  },
                ),
                const MorphemeSpacing.vertical8(),
                MapsButton(
                  icon: Icons.my_location,
                  onTap: () => context.read<MapCubit>().getCurrentLocation(),
                ),
                const MorphemeSpacing.vertical8(),
                MapsButton(
                  icon: Icons.explore_outlined,
                  onTap: () => context.read<MapCubit>().onCompassPressed(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget>? _headerButtonWidget(BuildContext context) {
    return [
      /// refresh button
      MorphemeTapDetector(
        onTap: () => context.read<MapCubit>().fetchAssignedReport(
              ListReportBody(
                status: ReportStatusEnum.assigned.value,
              ),
            ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MorphemeSizes.s16,
            vertical: MorphemeSizes.s10,
          ),
          child: Icon(
            Icons.autorenew,
            size: MorphemeSizes.s22,
          ),
        ),
      )
    ];
  }
}
