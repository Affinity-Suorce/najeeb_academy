import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

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
    case 'فيزياء':
      return 'assets/images/subjects/physics.png';
    case 'رياضيات':
      return 'assets/images/subjects/math.png';
    default:
      return 'assets/images/logo.png';
  }
}

// int getLectureIndex(int index) {

// }
Subject getLectureSubject(List<Subject> subjects, int lectureSubjectId) {
  Subject? temp;
  for (var subject in subjects) {
    if (subject.id == lectureSubjectId) temp = subject;
  }
  return temp ?? subjects[0];
}

int getHourFromStringTime(String time) {
  return int.parse(time.split(':')[0]);
}

int getMinuteFromStringTime(String time) {
  return int.parse(time.split(':')[1].split(' ')[0]);
}
