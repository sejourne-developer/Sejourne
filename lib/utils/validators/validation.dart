import 'package:sejourne/data/services/exporter.dart';

class TValidator {
  /// Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName ${TTexts.required.tr}";
    }
    return null;
  }

  static String? passwordMatch(String? value1, String? value2) {
    if (value1 != value2) {
      return TTexts.passMisMatchValidator.tr;
    }
    return null;
  }

  /// OTP Code Validation
  static String? validateOpt(
    String? value,
  ) {
    return value == '222222' ? null : 'Pin is incorrect';
  }

  /// Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.emailValidator.tr;
    }

    // Regular Expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return TTexts.invalidEmail.tr;
    }
    return null;
  }

  /// Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.passValidator.tr;
    }
    //Check for minimum password length
    if (value.length < 6) {
      return TTexts.passLength.tr;
    }
    //Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return TTexts.passContain.tr;
    }
    //Check for number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return TTexts.passNum.tr;
    }
    //Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return TTexts.passSpecialChar.tr;
    }
    return null;
  }

  /// Phone Number Validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return TTexts.phoneValidator.tr;
    }
    // Regular Expression for phone number validation
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return TTexts.invalidNum.tr;
    }

    return null;
  }
}
