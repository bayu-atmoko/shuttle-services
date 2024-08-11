import 'package:core/core.dart';

import 'presentation/cubit/help_cubit.dart';

void setupLocatorHelp() {
  // *Cubit
  locator.registerFactory(() => HelpCubit());
}
