mixin TextUtil {
  static String capitalize(String? text) {
    if (text == null || text.isEmpty) {
      return "";
    } else if (text.length == 1) {
      return text.toUpperCase();
    } else {
      return text[0].toUpperCase() + text.substring(1);
    }
  }

  static bool isEmailValid(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  static bool isValidFutureDate(int month, int day, int year) {
    try {
      DateTime inputDate = DateTime(year, month, day);
      DateTime currentDate = DateTime.now();

      if (inputDate.isAfter(currentDate)) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }
}
