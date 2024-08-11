//
// Generated file. Edit just you manually add or delete a feature.
//

import 'package:auth/locator.dart';
import 'package:core/core.dart';
import 'package:home/locator.dart';

import 'package:profile/locator.dart';

import 'routes/routes.dart';
import 'package:route/locator.dart';
import 'package:help/locator.dart';
import 'package:main/locator.dart';

void setupLocator() {
  locator.registerLazySingleton(() => Routes.router);
  setupLocatorFeatureCore();
  setupLocatorFeatureAuth();
  setupLocatorFeatureHome();
  setupLocatorFeatureProfile();
  setupLocatorFeatureRoute();
  setupLocatorFeatureHelp();
  setupLocatorFeatureMain();
}
