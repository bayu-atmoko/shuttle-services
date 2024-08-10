import 'package:flutter/material.dart';

class MorphemeScrollExpanded extends StatelessWidget {
  final Widget child;
  final double heightAppBar;
  final ScrollPhysics? physics;

  const MorphemeScrollExpanded({
    super.key,
    required this.child,
    this.heightAppBar = 0,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryData.fromView(View.of(context));

    return SingleChildScrollView(
      physics: physics,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: mediaQuery.size.height -
                heightAppBar -
                mediaQuery.padding.top -
                mediaQuery.padding.bottom),
        child: IntrinsicHeight(child: child),
      ),
    );
  }
}
