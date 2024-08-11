import 'package:core/core.dart';
import 'package:help/help/presentation/pages/help_page.dart';

List<StatefulShellBranch> helpRoutes = [
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: PathRoutes.help,
        builder: (context, state) => const HelpPage(),
      ),
    ],
  ),
];
