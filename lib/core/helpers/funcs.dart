import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/core/network/urls.dart';

String indexFunction(int index) =>
    index <= 9 ? "0$index".toString() : index.toString();

String getErrorMessage(Failure error) {
  if (error is ServerFailure) {
    return 'المخدم متوقف أعد المحاولة لاحقا';
  } else if (error is HttpFailure) {
    return error.message;
  } else {
    return 'حدث خطأ غير معروف أعد المحاولة';
  }
}

String getResponseMessage(Map response) {
  return response["status"]["original"]["msg"].toString();
}

String getUserName(String text) =>
    text.split("@")[0].split('.')[0].split('-')[0];

String getImageUrl(String imageUrl) => baseUrl + imageUrl;

String getSubjectImage(String subjectName) {
  switch (subjectName) {
    case 'اللغة الإنكليزية':
      return 'assets/images/subjects/english.png';
    case 'كيمياء':
      return 'assets/images/subjects/chemistry.png';
    case 'اللغة الفرنسية':
      return 'assets/images/subjects/french.png';
    case 'اللغة العربية':
      return 'assets/images/subjects/arabic.png';
    case 'فيزيا':
      return 'assets/images/subjects/physics.png';
    case 'رياضيات':
      return 'assets/images/subjects/english.png';
    default:
      return 'assets/images/logo.png';
  }
}
