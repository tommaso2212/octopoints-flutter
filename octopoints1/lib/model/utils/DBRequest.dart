class DBRequest {
  static Future<R> executeRequest<T, R>(T value, Function function) async {
    try {
      return await function(value);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
