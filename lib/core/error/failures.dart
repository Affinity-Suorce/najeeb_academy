class Failure {}

class ServerFailure extends Failure {}

class InternetFailure extends Failure {}

class HttpFailure extends Failure {
  final message;

  HttpFailure(this.message);
}
