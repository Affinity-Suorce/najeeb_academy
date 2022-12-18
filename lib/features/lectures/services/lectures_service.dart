import 'package:flutter/rendering.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';

class LectureServices {
  List<int> _watchedLecturesIds = [];
  List<Lecture> _lecturesList = [];
  void setLectures(List<Lecture> lectures) {
    _lecturesList = lectures;
  }

  void addWatchedLectureId(int id) {
    List<int> temp = _watchedLecturesIds;
    temp.add(id);

    _watchedLecturesIds = temp.toSet().toList();
    debugPrint('watchedLectures:$_watchedLecturesIds');
  }

  List<Lecture> get getLectures => _lecturesList;
  List<int> get getWatchedLecturesIds => _watchedLecturesIds;
}
