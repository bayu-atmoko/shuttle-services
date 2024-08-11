import 'package:core/core.dart';
import 'package:flutter/material.dart' show BuildContext;

abstract class ValidatorValueHelper {
  static ValidatorValue? validatorEmail(BuildContext context, String value) {
    if (!value.isEmail) {
      return ValidatorValue(
        message: context.s.emailError,
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static ValidatorValue? validatorEmpty(BuildContext context, String value) {
    if (value.isEmpty) {
      return ValidatorValue(
        message: context.s.emptyError,
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static ValidatorValue? validatorPhone(BuildContext context, String value) {
    if (value.isEmpty) {
      return ValidatorValue(
        message: context.s.emptyError,
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (value.trim().substring(0, 1) != "0") {
      return ValidatorValue(
        message: context.s.phoneError,
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (!MorphemeRegExp.phone.hasMatch(value)) {
      return ValidatorValue(
        message: context.s.phoneInvalid,
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static ValidatorValue? validatorPassword(BuildContext context, String value) {
    if (!MorphemeRegExp.password.hasMatch(value) || value.contains(' ')) {
      return ValidatorValue(
        message: context.s.passwordError,
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static ValidatorValue? validatorConfirmPassword(
    BuildContext context,
    String value,
    String password,
  ) {
    if (!MorphemeRegExp.password.hasMatch(value) || value.contains(' ')) {
      return ValidatorValue(
        message: context.s.passwordError,
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (password != value) {
      return ValidatorValue(
        message: context.s.confirmPasswordError,
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static bool isValidEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) {
    return validatorEmail(context, email).isValid() &&
        validatorPassword(context, password).isValid();
  }
}
