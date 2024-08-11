import 'package:core/core.dart';
import 'package:profile/change_password/presentation/pages/change_password_page.dart';
import 'package:profile/edit_profile/presentation/pages/edit_profile_page.dart';
import 'package:profile/profile/presentation/pages/profile_page.dart';

List<StatefulShellBranch> profileRoutes = [
  StatefulShellBranch(routes: [
    GoRoute(
      path: PathRoutes.profile,
      builder: (context, state) => const ProfilePage(),
      routes: [
        GoRoute(
          path: MorphemeRoutes.changePassword,
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) => const ChangePasswordPage(),
        ),
        GoRoute(
          path: MorphemeRoutes.editProfile,
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state) {
            final profile = state.extra as ExtraUser;
            return EditProfilePage(
              profile: profile,
            );
          },
        ),
      ],
    ),
  ]),
];
