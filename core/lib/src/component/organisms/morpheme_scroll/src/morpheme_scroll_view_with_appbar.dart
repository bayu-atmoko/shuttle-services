import 'package:core/src/component/atoms/morpheme_text.dart';
import 'package:core/src/component/organisms/morpheme_scroll/src/morpheme_scroll_expanded.dart';
import 'package:core/src/constants/src/morpheme_sizes.dart';
import 'package:flutter/material.dart';

class MorphemeScrollViewWithAppBar extends StatelessWidget {
  final Widget child;
  final Color? background;
  final String tittle;
  final bool isScroll;
  final bool isExpanded;
  final Widget? bottomSheet;
  final double? heightAppBar;
  final bool? resizeToAvoidBottomInset;
  final ScrollPhysics? physics;
  final double? titleSpacing;
  final Widget? floatingActionButton;
  final List<Widget>? actionsAppBar;

  const MorphemeScrollViewWithAppBar({
    super.key,
    required this.child,
    this.background,
    required this.tittle,
    this.isScroll = true,
    this.isExpanded = false,
    this.bottomSheet,
    this.heightAppBar,
    this.resizeToAvoidBottomInset,
    this.physics,
    this.titleSpacing,
    this.floatingActionButton,
    this.actionsAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MorphemeText.titleLarge(tittle),
        titleSpacing: titleSpacing,
        actions: actionsAppBar,
      ),
      floatingActionButton: floatingActionButton,
      backgroundColor: background ?? Colors.white,
      bottomSheet: bottomSheet,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: isExpanded
          ? MorphemeScrollExpanded(
              heightAppBar: heightAppBar ?? MorphemeSizes.s56,
              physics: physics,
              child: child,
            )
          : isScroll
              ? SingleChildScrollView(
                  physics: physics,
                  child: child,
                )
              : child,
    );
  }
}
