import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/expired_token/domain/repositories/expired_token_repository.dart';

class ExpiredTokenRepositoryImpl implements ExpiredTokenRepository {
  /// singleton class instance
  static final ExpiredTokenRepositoryImpl _instance =
      ExpiredTokenRepositoryImpl._internal();

  ExpiredTokenRepositoryImpl._internal();

  factory ExpiredTokenRepositoryImpl({
    required BuildContext? context,
  }) {
    _instance.context = context;

    return _instance;
  }

  BuildContext? context;

  /// apps has moved page to ExpiredTokenPage
  bool isMoveToTokenPage = false;

  // TODO error code token expired 401
  @override
  void moveToExpiredTokenPage() async {
    if (!isMoveToTokenPage) {
      isMoveToTokenPage = true;

      FlutterSecureStorageHelper.removeToken();
      FlutterSecureStorageHelper.removeRole();

      if (context != null) {
        context?.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context!,
            message: context!.s.tokenWasExpired,
          ),
        );
        context?.goToLogin();
      }
    }
  }

  @override
  void clearValue() {
    isMoveToTokenPage = false;
  }

  @override
  void setValueIsMoveToToken(bool value) {
    isMoveToTokenPage = value;
  }
}
