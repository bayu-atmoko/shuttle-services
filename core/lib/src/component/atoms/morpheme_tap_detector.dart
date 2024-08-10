import 'package:flutter/material.dart';

class MorphemeTapDetector extends StatelessWidget {
  const MorphemeTapDetector({
    super.key,
    required this.onTap,
    required this.child,
    this.semanticLabel,
    this.semanticButton,
    this.semanticChecked,
    this.excludingSemantic,
  });

  final GestureTapCallback? onTap;
  final Widget child;
  final String? semanticLabel;
  final bool? semanticButton;
  final bool? semanticChecked;
  final bool? excludingSemantic;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: semanticButton,
      checked: semanticChecked,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        onTap: onTap,
        child: ExcludeSemantics(
          excluding: excludingSemantic ?? false,
          child: child,
        ),
      ),
    );
  }
}
