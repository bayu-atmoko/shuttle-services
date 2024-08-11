import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/detail_route/domain/entities/detail_route_entity.dart';
import 'package:route/detail_route/presentation/widgets/route_item.dart';

class ReportList extends StatelessWidget {
  ReportList({
    super.key,
    required this.data,
  });

  final DataDetailRoute? data;
  final ScrollController controllerScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<StepDetailRoute> step = _prepareStepListData();

    return Scrollbar(
      controller: controllerScroll,
      thickness: MorphemeSizes.s4,
      radius: const Radius.circular(
        MorphemeSizes.s4,
      ),
      trackVisibility: true,
      thumbVisibility: true,
      child: ListView.builder(
        controller: controllerScroll,
        padding: const EdgeInsets.only(
          bottom: MorphemeSizes.marginPage,
        ),
        itemCount: step.length,
        itemBuilder: (context, index) {
          final String? address = step[index].destination?.address;
          final String? village = step[index].destination?.village;
          final String? district = step[index].destination?.district;
          final String fullAddress = address.orEmpty() +
              (village.isNotNullOrEmpty ? ', ${village.orEmpty()}' : '') +
              (district.isNotNullOrEmpty ? ', ${district.orEmpty()}' : '');

          return RouteItem(
            number: (index + 1).toString(),
            distance: step[index].distance ?? 0,
            duration: step[index].duration ?? 0,
            address: fullAddress,
          );
        },
      ),
    );
  }

  List<StepDetailRoute> _prepareStepListData() {
    List<StepDetailRoute> step = [
      StepDetailRoute(
        stepId: 0,
        routeId: data?.routeId,
        stepNumber: 0,
        distance: 0,
        duration: 0,
        destinationLocationId: 0,
        createdAt: null,
        updatedAt: null,
        deletedAt: null,
        destination: AlphaDestinationDetailRoute(
          locationId: data?.origin?.locationId,
          name: data?.origin?.name,
          address: data?.origin?.address,
          latitude: data?.origin?.latitude,
          longitude: data?.origin?.longitude,
          createdAt: data?.origin?.createdAt,
          updatedAt: data?.origin?.updatedAt,
          deletedAt: data?.origin?.deletedAt,
          district: data?.origin?.district,
          village: data?.origin?.village,
        ),
      ),
    ];
    step.addAll(data?.step ?? []);
    return step;
  }
}
