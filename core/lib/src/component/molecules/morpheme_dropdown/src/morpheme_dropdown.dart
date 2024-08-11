import 'package:core/core.dart';
import 'package:core/src/component/molecules/morpheme_dropdown/src/morpheme_raw_dropdown.dart';
import 'package:flutter/material.dart';

class MorphemeDropdown<T> extends StatelessWidget {
  const MorphemeDropdown({
    super.key,
    this.hintText,
    this.value,
    this.items = const [],
    this.onChanged,
    this.margin,
    this.title,
    this.isRequired = false,
    this.onPressed,
    this.isValid,
  });

  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final EdgeInsetsGeometry? margin;
  final String? title;
  final bool isRequired;
  final GestureTapCallback? onPressed;
  final bool? isValid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotNullOrEmpty) ...[
          MorphemeText.labelLarge(title.orEmpty()),
          if (isRequired)
            Transform.translate(
              offset: const Offset(0, -5),
              child: Text(
                "*",
                style: TextStyle(
                  fontSize: MorphemeSizes.font18,
                  fontWeight: FontWeight.w400,
                  color: context.color.grey,
                ),
              ),
            ),
          const MorphemeSpacing.vertical8(),
        ],
        MorphemeTapDetector(
          onTap: onPressed,
          child: MorphemeRawDropdownButtonFormField<T>(
            style: TextStyle(
              color: context.color.black,
              fontSize: MorphemeSizes.font18,
            ),
            isExpanded: true,
            hint: Padding(
              padding: const EdgeInsets.only(left: MorphemeSizes.s15),
              child: MorphemeText.titleSmall(
                hintText ?? context.s.emptyDropdown,
                color: Colors.grey[350],
                fontWeight: FontWeight.normal,
              ),
            ),
            value: value,
            items: items,
            onChanged: onChanged,
          ),
        ),
        if (isValid == false) ...[
          MorphemeStatusMessage.error(
            context: context,
            text: context.s.emptyError,
          )
        ]
      ],
    );
  }
}
