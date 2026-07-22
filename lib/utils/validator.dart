class Validator {
  static String regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String regexMobile = r"^\d{10}$";

  static bool validateDayOfTheYear(String nic) {
    bool ret = false;
    int sex = 0;
    if (nic.length == 10) {
      sex = int.parse(nic.substring(2, 5));
    } else if (nic.length == 12) {
      sex = int.parse(nic.substring(4, 7));
    }

    if ((sex > 0 && sex <= 366) || sex > 500 && sex <= 866) {
      ret = true;
    } else {
      ret = false;
    }
    return ret;
  }

  static bool validateEmail(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }
}
