import 'package:dependency_manager/dependency_manager.dart';
import 'package:flutter/material.dart';

class MorphemeShimmer extends StatelessWidget {
  final Widget child;

  const MorphemeShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      enabled: true,
      child: child,
    );
  }
}
