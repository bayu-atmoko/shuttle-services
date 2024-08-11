import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:help/help/presentation/widgets/contact_menu.dart';

import '../cubit/help_cubit.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage>
    with MorphemeStatePage<HelpPage, HelpCubit> {
  @override
  HelpCubit setCubit() => locator<HelpCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    return MorphemeScrollViewWithAppBar(
      tittle: context.s.help,
      titleSpacing: MorphemeSizes.s16,
      isScroll: true,
      child: Padding(
        padding: const EdgeInsets.all(MorphemeSizes.marginPage),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MorphemeText.titleSmall(
              context.s.contactUs,
              fontWeight: FontWeight.bold,
            ),
            const MorphemeSpacing.vertical16(),
            ContactMenu(
              icon: '',
              customIcon: Icon(
                Icons.phone_in_talk,
                color: context.color.primaryDark,
                size: MorphemeSizes.s22,
              ),
              tittle: context.s.callUsOnNumber,
              contactInfo: MorphemeString.phoneUpt,
              onTap: () {},
            ),
            const MorphemeSpacing.vertical16(),
            ContactMenu(
              icon: '',
              customIcon: Icon(
                Icons.email,
                color: context.color.primaryDark,
                size: MorphemeSizes.s22,
              ),
              tittle: context.s.email,
              contactInfo: MorphemeString.emailUpt,
              onTap: () {},
            ),
            const MorphemeSpacing.vertical16(),
            ContactMenu(
              icon: MorphemeImages.whatsapp,
              tittle: context.s.whatsapp,
              contactInfo: MorphemeString.whatsappUpt,
              onTap: () {},
            ),
            const MorphemeSpacing.vertical16(),
            ContactMenu(
              icon: MorphemeImages.instagram,
              tittle: context.s.instagram,
              contactInfo: MorphemeString.instagramUpt,
              onTap: () {},
            ),
            const MorphemeSpacing.vertical16(),
            ContactMenu(
              icon: MorphemeImages.twitter,
              tittle: context.s.twitter,
              contactInfo: MorphemeString.twitterUpt,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
