import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CoursesServices {
  List<Subject> _subjectList = [];
  List<int> _coursesIds = [];
  List<int> _subjectsIds = [];
  int _fullPrice = 0;
  void setSubjects(List<Subject> subjects) {
    _subjectList = subjects;
  }

  void clearFullPrice() {
    _fullPrice = 0;
  }

  void setFullPriceOfSelectedCourses() {
    List<Subject> selectedSubjects = _subjectList
        .where((subject) => _subjectsIds.any((id) => id == subject.id))
        .toList();
    for (Subject subject in selectedSubjects) {
      _fullPrice = _fullPrice + int.parse(subject.cost?.split('.')[0] ?? "0");
    }
  }

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

  List<int> get getSelectedCourses => _coursesIds;
  List<int> get getSelectedSubjects => _subjectsIds;
  int get getfullPrice => _fullPrice;
}
