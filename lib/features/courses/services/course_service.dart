import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CoursesServices {
  List _coursesIds = [];
  List _subjectsIds = [];
  void setCoursesids(int courseId) {
    if (_coursesIds.every((element) => element != courseId)) {
      _coursesIds.add(courseId);
    }
    debugPrint("_coursesIds::$_coursesIds");
  }

  void removeCourseId(int courseId) {
    _coursesIds.remove(courseId);
    debugPrint("_coursesIds::$_coursesIds");
  }

  void setSubjectsIds(List<dynamic> subjectsList) {
    subjectsList
        .toSet()
        .toList()
        .where((element) => element != null)
        .forEach((element) {
      _subjectsIds.add(element);
    });
    debugPrint("_subjectsIds::$_subjectsIds");
  }

  void removeSubjectsIds(int index) {
    _subjectsIds.remove(index);
    debugPrint("_subjectsIds::$_subjectsIds");
  }

  void resetLists() {
    _coursesIds = [];
    _subjectsIds = [];
  }

  List get getSelectedCourses => _coursesIds;
  List get getSelectedSubjects => _subjectsIds;
}
