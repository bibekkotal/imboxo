import 'package:form_validator/form_validator.dart';

import 'app_strings.dart';

// REGEX
RegExp strongPassword = RegExp(
  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[=.!@/$#\$&*~%^()_+-]).{6,}$',
);
RegExp strongUserName = RegExp(
  r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$',
);
RegExp validAddress = RegExp(r'^\d+(?:\.\d+)?$');

final Map<String, ValidationBuilder> registerValidationSchema = {
  'phone': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.phoneRequiredStrongMsg,
      )
      .minLength(9, StaticStrings.phoneMaxLengthMsg)
      .maxLength(11, StaticStrings.phoneMaxLengthMsg)
      .phone(StaticStrings.phoneValidMsg),
  'name': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.nameRequiredMsg,
      )
      .minLength(3, StaticStrings.nameTooShortMsg)
      .maxLength(100, StaticStrings.nameTooLongMsg),

  'email': ValidationBuilder(
    optional: false,
    requiredMessage: StaticStrings.emailRequiredMsg,
  ).email(StaticStrings.emailInvalidMsg),

  'password': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.passwordRequiredMsg,
      )
      .minLength(6, StaticStrings.passwordTooShortMsg)
      .regExp(strongPassword, StaticStrings.passwordWeakMsg),

  'confirmPassword': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.confirmPasswordRequiredMsg,
      )
      .minLength(6, StaticStrings.confirmPasswordTooShortMsg)
      .regExp(strongPassword, StaticStrings.confirmPasswordWeakMsg),
};

final Map<String, ValidationBuilder> loginValidationSchema = {
  'email': ValidationBuilder(
    optional: false,
    requiredMessage: StaticStrings.emailRequiredMsg,
  ).email(StaticStrings.emailInvalidMsg),

  'password': ValidationBuilder(
        optional: false,
        requiredMessage: StaticStrings.passwordRequiredMsg,
      )
      .minLength(6, StaticStrings.passwordTooShortMsg)
      .regExp(strongPassword, StaticStrings.passwordWeakMsg),
};
