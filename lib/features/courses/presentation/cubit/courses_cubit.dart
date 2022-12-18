import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  final CoursesRepositories _coursesRepositories;
  CoursesCubit(this._coursesRepositories) : super(CoursesInitial());
  Future<void> getMyCourses(bool isAllCourses) async {
    emit(LoadingState());
    final either = await _coursesRepositories.getMyCourses(isAllCourses);
    either.fold((error) async {
      final errorMessage = getErrorMessage(error);
      emit(ErrorState(errorMessage));
    }, (data) {
      isAllCourses
          ? emit(GotAllCoursesState(data))
          : emit(GotCoursesState(data));
    });
  }
}
