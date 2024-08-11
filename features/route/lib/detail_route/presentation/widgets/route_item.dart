import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RouteItem extends StatelessWidget {
  const RouteItem({
    super.key,
    required this.number,
    required this.distance,
    required this.duration,
    required this.address,
  });

  final String number;
  final int distance;
  final int duration;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MorphemeSpacing.vertical12(),
        if (number != "1") ...[
          Row(
            children: [
              const MorphemeSpacing.horizontal16(),
              Icon(
                Icons.arrow_downward_rounded,
                size: MorphemeSizes.s24,
                color: context.color.primary,
              ),
              const MorphemeSpacing.horizontal8(),
              MorphemeText.bodySmall(
                _getDistance(),
                maxLines: 1,
              ),
              MorphemeText.bodySmall(
                _getDuration(context),
                maxLines: 1,
              ),
              const MorphemeSpacing.horizontal12(),
              const Expanded(
                child: MorphemeDivider.horizontal(
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ],
        const MorphemeSpacing.vertical10(),
        Container(
          constraints: const BoxConstraints(
            minHeight: MorphemeSizes.s60,
          ),
          padding: const EdgeInsets.only(
            left: MorphemeSizes.marginPage,
            right: MorphemeSizes.s10,
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MorphemeSpacing.horizontal8(),
              MorphemeText.titleSmall(
                "$number.",
                maxLines: 1,
                fontWeight: FontWeight.bold,
              ),
              const MorphemeSpacing.horizontal12(),
              Expanded(
                child: MorphemeText.titleSmall(
                  address,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getDistance() {
    if (distance >= 1000) {
      double distanceInKilometers = distance / 1000;
      NumberFormat numberFormat = NumberFormat('#.###');
      String formattedDistance = numberFormat.format(distanceInKilometers);
      return "$formattedDistance km,  ";
    } else {
      return "$distance m,  ";
    }
  }

  String _getDuration(BuildContext context) {
    if (duration >= 3600) {
      return "${(duration / 3600).floor()} ${context.s.hour},  +${(duration % 3600).floor()} ${context.s.minute}";
    } else if (duration >= 60) {
      return "${(duration / 60).floor()} ${context.s.minute}";
    } else {
      return "$duration ${context.s.second}";
    }
  }
}
