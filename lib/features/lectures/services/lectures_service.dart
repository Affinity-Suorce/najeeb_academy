import 'package:flutter/rendering.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LectureServices {
  final SharedPreferences _preferences;

  LectureServices(this._preferences);
  
  List<int> _watchedLecturesIds = [];
  List<Lecture> _lecturesList = [];
  void setLectures(List<Lecture> lectures) {
    _lecturesList = lectures;
  }

  void addWatchedLectureId(int id) {
    List<int> temp = _watchedLecturesIds;
    temp.add(id);

    _watchedLecturesIds = temp.toSet().toList();
    _preferences.setInt('watched_lectures',_watchedLecturesIds.length);
    debugPrint('watchedLectures:$_watchedLecturesIds');
  }

  List<Lecture> get getLectures => _lecturesList;
  List<int> get getWatchedLecturesIds => _watchedLecturesIds;
  int get getWatchedLecturesCount => _preferences.getInt('watched_lectures') ?? 0;
}
