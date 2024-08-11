import 'package:dependency_manager/dependency_manager.dart';
import 'package:flutter/material.dart';

class MorphemeShimmerCardText extends StatelessWidget {
  final double width;
  final int? itemCount;
  final double? heightItem;
  final double? topPaddingItem;

  const MorphemeShimmerCardText({
    super.key,
    required this.width,
    this.itemCount = 4,
    this.heightItem,
    this.topPaddingItem,
  });

  @override
  Widget build(BuildContext context) {
    double height = heightItem ?? 14.55;
    double topPadding = topPaddingItem ?? 7.3;
    const double bottomPadding = 1;
    final BoxDecoration decoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(3.6),
    );
    return SizedBox(
      width: width,
      height: height * itemCount! +
          topPadding * (itemCount! - 1) +
          bottomPadding * itemCount!,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: itemCount!,
          itemBuilder: (context, index) {
            return Container(
              width: width,
              padding: EdgeInsets.only(
                top: index != 0 ? topPadding : 0,
                bottom: bottomPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  index != (itemCount! - 1)
                      ? _buildContainer(
                          width,
                          height,
                          decoration,
                          null,
                        )
                      : _buildContainer(
                          40 / 100 * width,
                          height,
                          decoration,
                          null,
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(
    double width,
    double height,
    BoxDecoration decoration,
    EdgeInsetsGeometry? margin,
  ) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: decoration,
    );
  }
}
