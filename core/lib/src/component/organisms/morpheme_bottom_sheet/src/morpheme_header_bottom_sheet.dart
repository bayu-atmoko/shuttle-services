import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeHeaderBottomSheet extends StatelessWidget {
  final String title;
  final bool? isLineTopVisible;
  final IconPosition? iconPosition;
  final double? height;

  const MorphemeHeaderBottomSheet({
    super.key,
    required this.title,
    this.isLineTopVisible,
    this.iconPosition,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (iconPosition == IconPosition.start) ...[
                    _closeIcon(context),
                    const SizedBox(width: 15),
                  ],
                  Expanded(
                    child: MorphemeText.titleMedium(
                      title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (iconPosition == IconPosition.end) ...[
                    _closeIcon(context),
                  ],
                ],
              ),
            ],
          ),
        ),
        MorphemeDivider.horizontal(
          width: double.infinity,
          color: context.color.grey,
        ),
      ],
    );
  }

  MorphemeTapDetector _closeIcon(BuildContext context) {
    return MorphemeTapDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Container(
        width: 30,
        height: 30,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Icon(
          Icons.close,
          color: context.color.black,
          size: 20,
        ),
      ),
    );
  }
}
