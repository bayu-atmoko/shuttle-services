import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../cubit/login_cubit.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with MorphemeStatePage<LoginPage, LoginCubit> {
  @override
  LoginCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    return const Scaffold(
      key: ValueKey(MorphemeDataTesId.pageLogin),
      body: SingleChildScrollView(
        key: ValueKey(MorphemeDataTesId.scrollLogin),
        padding: EdgeInsets.symmetric(vertical: MorphemeSizes.marginPage),
        child: Column(
          children: [
            MorphemeSpacing.vertical72(),
            MorphemeImageAsset(
              MorphemeImages.logoUptPengelolaanSampah2,
              height: MorphemeSizes.s80,
            ),
            MorphemeSpacing.vertical32(),
            LoginWithEmail(),
            MorphemeSpacing.vertical32(),
            NewRegister(),
          ],
        ),
      ),
    );
  }
}
