import 'dart:convert';

import 'package:core/src/constants/src/morpheme_endpoints.dart';
// import 'package:core/src/environment.dart';
import 'package:core/src/helper/helper.dart';
import 'package:dependency_manager/dependency_manager.dart'
    show FlutterSecureStorage;
import 'package:flutter/foundation.dart';
import 'package:morpheme_library/morpheme_library.dart';

import 'global_variable.dart';

void setupLocatorFeatureCore() {
  locator.registerLazySingleton(() => const FlutterSecureStorage());
  // locator.registerLazySingleton(() => FirebaseRemoteConfig.instance);
  if (!kIsWeb) {
    locator.registerLazySingleton(
      () => MorphemeInspector(
        // TODO isNotProd
        showInspectorOnShake: true,
        showNotification: true,
        saveInspectorToLocal: true,
        // showInspectorOnShake: Environment.isNotProd,
        // showNotification: Environment.isNotProd,
        // saveInspectorToLocal: Environment.isNotProd,
      ),
    );
  }
  locator.registerLazySingleton(
    () => MorphemeHttp(
      timeout: 30000,
      showLog: true,
      // showLog: Environment.isNotProd,
      morphemeInspector: kIsWeb ? null : locator(),
      headers: {'content-type': 'application/json'},
      authTokenOption: AuthTokenOption(
        typeHeader: 'Authorization',
        prefixHeader: 'Bearer',
        getToken: () => FlutterSecureStorageHelper.getToken(),
        authCondition: (request, response) =>
            request.url == MorphemeEndpoints.login ||
            request.url == MorphemeEndpoints.register,
        onAuthTokenResponse: (response) async {
          try {
            final map = jsonDecode(response.body);
            final String? tokenRegister = map['data']?['token'];
            final String? tokenLogin = map['data']?['access_token'];
            await FlutterSecureStorageHelper.saveToken(
              tokenLogin.isNotNullOrEmpty ? tokenLogin : tokenRegister,
            );

            final String? roleLogin = map['data']?['profile']?['role'];
            final String? roleRegister = map['data']?['data']?['role'];
            await FlutterSecureStorageHelper.saveRole(
              roleLogin.isNotNullOrEmpty ? roleLogin : roleRegister,
            );
          } catch (_) {}
        },
        clearCondition: (request, response) =>
            request.url == MorphemeEndpoints.logout,
        onClearToken: () async {
          FlutterSecureStorageHelper.removeToken();
          FlutterSecureStorageHelper.removeRole();
        },
        excludeEndpointUsageToken: [
          MorphemeEndpoints.login,
          MorphemeEndpoints.register,
        ],
      ),
      // refreshTokenOption: RefreshTokenOption(
      //   method: RefreshTokenMethod.post,
      //   url: MorphemeEndpoints.refreshToken,
      //   condition: (request, response) =>
      //       request.url != MorphemeEndpoints.login && response.statusCode == 401,
      //   getBody: () async {
      //     final refreshToken =
      //         await FlutterSecureStorageHelper.getRefreshToken();

      //     return {
      //       'refresh_token': refreshToken ?? '',
      //     };
      //   },
      //   onResponse: (response) async {
      //     final map = jsonDecode(response.body);
      //     await FlutterSecureStorageHelper.saveRefreshToken(map['token']);
      //   },
      // ),
    ),
  );
}
