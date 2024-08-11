import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../pages/help_page.dart';

part 'help_state.dart';

class HelpCubit extends MorphemeCubit<HelpStateCubit> {
  HelpCubit() : super(HelpStateCubit());

  // @override
  // void initState(BuildContext context) {
  //   super.initState(context);
  // }

  // @override
  // void initAfterFirstLayout(BuildContext context) {
  //   super.initAfterFirstLayout(context);
  // }

  @override
  void initArgument<Page>(BuildContext context, Page widget) {
    super.initArgument(context, widget);
    if (widget is! HelpPage) return;
  }

  // @override
  // void didChangeDependencies(BuildContext context) {
  //   super.didChangeDependencies(context);
  // }

  // @override
  // void didUpdateWidget<Page>(
  //     BuildContext context, Page oldWidget, Page widget) {
  //   if (oldWidget is! HelpPage || widget is! HelpPage) return;
  // }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
