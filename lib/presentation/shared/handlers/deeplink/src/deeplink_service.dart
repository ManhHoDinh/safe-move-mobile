abstract class DeeplinkService {
  const DeeplinkService();

  Stream<String?> handleIncomingLinks();

  Future<String?> handleInitialLink();
}
