String phoneFormat(String value, [bool underScore = true]) {
  final regex = RegExp(r'^(01[0-9]|07[0-8]|09[0-9])([0-9]{3,4})([0-9]{4})$');
  final converted = value.replaceAllMapped(regex, (match) {
    if (underScore) {
      return '${match[1]}-${match[2]}-${match[3]}';
    }
    return '${match[1]}${match[2]}${match[3]}';
  });
  return converted;
}
