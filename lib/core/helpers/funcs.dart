import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/core/network/urls.dart';

String indexFunction(int index) =>
    index <= 9 ? "0$index".toString() : index.toString();

String getErrorMessage(Failure error) {
  if (error is ServerFailure) {
    return 'Server Is Busy Try Again Later';
  } else if (error is HttpFailure) {
    return error.message;
  } else {
    return 'Unknown error occurred... try again later';
  }
}

String getResponseMessage(Map response) {
  return response["status"]["original"]["msg"].toString();
}

String getUserName(String text) =>
    text.split("@")[0].split('.')[0].split('-')[0];

String getImageUrl(String imageUrl) => baseUrl + imageUrl;
