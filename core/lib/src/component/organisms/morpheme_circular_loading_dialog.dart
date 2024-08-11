import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeCircularLoadingDialog {
  static Future<void> showLoadingDialog(
    BuildContext context,
    GlobalKey key,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: MorphemeCircularLoadingDialogWidget(),
        );
      },
    );
  }
}

class MorphemeCircularLoadingDialogWidget extends StatelessWidget {
  const MorphemeCircularLoadingDialogWidget({
    super.key,
    this.isGreyBackground,
    this.background,
  });

  final bool? isGreyBackground;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ??
          (isGreyBackground == true
              ? Colors.black.withOpacity(0.3)
              : Colors.transparent),
      child: SimpleDialog(
        key: key,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 100),
        titlePadding: const EdgeInsets.all(0),
        elevation: 0,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const MorphemeSpacing.vertical24(),
                const CircularProgressIndicator(),
                const MorphemeSpacing.vertical24(),
                Text(
                  context.s.pleaseWaitForAMoment,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.color.primary,
                    fontSize: 12,
                  ),
                ),
                const MorphemeSpacing.vertical16(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
