class Converter {
  Converter._();

  static isBool(String name) {
    if (name == "true") {
      return true;
    } else {
      return false;
    }
  }
}
