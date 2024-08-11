import 'package:core/core.dart';
import 'package:main/expired_token/data/repositories/expired_token_repository.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

void setupLocatorExpiredToken() {
  // *Repository
  locator.registerLazySingleton<ExpiredTokenRepository>(
    () => ExpiredTokenRepositoryImpl(
      context: locator<GoRouter>().configuration.navigatorKey.currentContext,
    ),
  );
}
