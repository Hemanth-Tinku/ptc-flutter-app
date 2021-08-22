class Validate {
  static String validateUsername(String value) {
    if (value.isEmpty) {
      return "ID cannot be empty";
    } else if (value.length != 7) {
      return "ID Number must be of length 7";
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    } else {
      return null;
    }
  }
}
