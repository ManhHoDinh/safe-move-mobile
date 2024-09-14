import '../../../utilities/failure/failure.dart';

abstract class PersistentFailure extends Failure {
  const PersistentFailure();
}

class PersistentDeleteFailure extends PersistentFailure {
  const PersistentDeleteFailure();
}

class PersistentReadFailure extends PersistentFailure {
  const PersistentReadFailure();
}

class PersistentWriteFailure extends PersistentFailure {
  const PersistentWriteFailure();
}
