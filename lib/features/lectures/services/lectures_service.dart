import 'package:najeeb_academy/features/lectures/models/lecture.dart';

class LectureServices{
  List<int> _watchedLecturesIds = [];
  List<Lecture> _lecturesList = [];
  void setLectures(List<Lecture> lectures) {
    _lecturesList = lectures;
  }

  void addWatchedLectureId(int id) {
    List<int> temp = [];
    temp.add(id);
    temp.toSet().toList();
    _watchedLecturesIds = temp;
  }

  List<Lecture> get getLectures => _lecturesList;
  List<int> get getWatchedLecturesIds => _watchedLecturesIds;
}
