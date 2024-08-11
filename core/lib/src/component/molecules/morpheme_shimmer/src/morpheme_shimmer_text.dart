import 'package:flutter/material.dart';

class MorphemeShimmerText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const MorphemeShimmerText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: style ?? const TextStyle(fontSize: 12),
        ),
        _buildContainerText(),
      ],
    );
  }

  Positioned _buildContainerText() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(3.6),
        ),
      ),
    );
  }
}
