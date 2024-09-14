abstract interface class DIService<T> {
  const DIService();

  Future<T> load();
}
