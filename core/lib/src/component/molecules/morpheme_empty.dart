import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeEmpty extends StatelessWidget {
  const MorphemeEmpty({
    super.key,
    this.title,
    this.isError = false,
  });

  const MorphemeEmpty.error({
    super.key,
    this.title,
    this.isError = true,
  });

  final String? title;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    String titleMessage = title ??
        (isError ? context.s.thereAreTechError : context.s.thereAreNoData);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_rounded,
          size: MorphemeSizes.s130,
          color: context.color.grey,
        ),
        const MorphemeSpacing.vertical16(),
        MorphemeText.titleMedium(
          titleMessage,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
