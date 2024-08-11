import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/upload_file_cubit.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage>
    with MorphemeStatePage<UploadFilePage, UploadFileCubit> {
  @override
  UploadFileCubit setCubit() => locator<UploadFileCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UploadFile')),
      body: Container(),
    );
  }
}
