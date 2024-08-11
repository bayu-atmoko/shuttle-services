import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../pages/upload_file_page.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends MorphemeCubit<UploadFileStateCubit> {
  UploadFileCubit() : super(UploadFileStateCubit());

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
    if (widget is! UploadFilePage) return;
  }

  // @override
  // void didChangeDependencies(BuildContext context) {
  //   super.didChangeDependencies(context);
  // }

  @override
  void didUpdateWidget<Page>(
      BuildContext context, Page oldWidget, Page widget) {
    if (oldWidget is! UploadFilePage || widget is! UploadFilePage) return;
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [];

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
