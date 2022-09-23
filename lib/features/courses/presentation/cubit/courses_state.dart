part of 'courses_cubit.dart';

abstract class CoursesState {
  const CoursesState();
}

class CoursesInitial extends CoursesState {}

class LoadingState extends CoursesState {}

class GotCoursesState extends CoursesState {
  final List<CourseModel> courses;

  GotCoursesState(this.courses);
}
class ErrorState extends CoursesState {
  final message;

  ErrorState(this.message);
}
