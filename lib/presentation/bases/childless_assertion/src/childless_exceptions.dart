import 'package:nested/nested.dart';

class ChildlessUsageNotAllowed implements Exception {
  const ChildlessUsageNotAllowed();

  @override
  String toString() {
    return 'Childless usage outside of $Nested not allowed.';
  }
}
