import '../constants/voco_strings.dart';

class Validators {
  Validators._();

  static String? _validation(
    String? val,
    RegExp regExp,
    String message,
  ) {
    if (val != null && val.isNotEmpty) {
      if (regExp.hasMatch(val)) {
        return null;
      } else {
        return message;
      }
    } else {
      return cannotBlankValidator(val);
    }
  }

  static String? cannotBlankValidator(String? val) {
    if (val == null || val.isEmpty) {
      return VocoStrings.cannotBlank;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? val) {
    RegExp regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    String message = VocoStrings.validEmail;

    return _validation(val, regExp, message);
  }
}
