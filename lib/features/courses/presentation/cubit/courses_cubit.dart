import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesRepositories _CoursesRepositories;
  CoursesCubit(this._CoursesRepositories) : super(CoursesInitial());
  Future<void> getMyCourses(bool isAllCourses) async {
    emit(LoadingState());
    final either = await _CoursesRepositories.getMyCourses(isAllCourses);
    either.fold((error) async {
      final errorMessage = getErrorMessage(error);
      emit(ErrorState(errorMessage));
    }, (data) {
      emit(GotCoursesState(data));
    });
  }
}
