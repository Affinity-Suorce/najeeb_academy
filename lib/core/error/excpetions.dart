class ServerException implements Exception {}

class HttpException implements Exception {
  final message;

  HttpException(this.message);
}
