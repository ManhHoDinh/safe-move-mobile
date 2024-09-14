String convertFailureCode(String input) {
  input = input.toLowerCase();
  final List<String> parts = input.split('-');
  return parts.join();
}
