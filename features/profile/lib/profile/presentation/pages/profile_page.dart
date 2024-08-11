import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile/mapper.dart';
import 'package:profile/profile/presentation/widgets/profile_information.dart';
import 'package:profile/profile/presentation/widgets/profile_menu.dart';

import '../cubit/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with MorphemeStatePage<ProfilePage, ProfileCubit> {
  @override
  ProfileCubit setCubit() => locator<ProfileCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final profile =
        context.select((ProfileCubit element) => element.state).profile;

    return Column(
      children: [
        const ProfileInformation(),
        const MorphemeDivider.horizontal(width: double.infinity),
        ProfileMenu(
          icon: Icons.person_rounded,
          tittle: context.s.editAccount,
          onTap: () async {
            if (profile != null) {
              bool? isRefresh =
                  await context.goToEditProfile(profile.toParams());

              if (isRefresh == true) {
                // ignore: use_build_context_synchronously
                context.read<ProfileCubit>().fetchProfile();
              }
            }
          },
        ),
        const MorphemeDivider.horizontal(width: double.infinity),
        ProfileMenu(
          icon: Icons.lock_rounded,
          tittle: context.s.changePassword,
          onTap: () => context.goToChangePassword(),
        ),
        const MorphemeDivider.horizontal(width: double.infinity),
        ProfileMenu(
          icon: Icons.exit_to_app_rounded,
          tittle: context.s.exit,
          onTap: () => MorphemeShowBottomSheet().showGlobalBottomSheet2Button(
            context,
            tittle: context.s.doYouWantToExit,
            onPressed2: () {
              Navigator.of(context).pop();
              context.read<ProfileCubit>().fetchLogout();
            },
          ),
        ),
        const MorphemeDivider.horizontal(width: double.infinity),
      ],
    );
  }
}
