
extension CapitalizeFirstLetterExtension on String {
  String get capitalizeFirstLetter {
    if (isEmpty) {
      return this;
    }
    return substring(0, 1).toUpperCase() + substring(1);
  }
}