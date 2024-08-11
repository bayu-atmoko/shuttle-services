import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeMenuIconItem extends StatelessWidget {
  final String tittle;
  final Function onTap;
  final IconData imageAssets;
  final Color? colorText;
  final Color? colorImage;

  const MorphemeMenuIconItem({
    super.key,
    required this.tittle,
    required this.onTap,
    required this.imageAssets,
    this.colorText,
    this.colorImage,
  });

  @override
  Widget build(BuildContext context) {
    return MorphemeTapDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                Icon(
                  imageAssets,
                  size: MorphemeSizes.s25,
                  color: colorImage,
                ),
                const SizedBox(width: 15),
                MorphemeText.titleMedium(
                  tittle,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const MorphemeDivider.horizontal(width: double.infinity),
        ],
      ),
    );
  }
}
