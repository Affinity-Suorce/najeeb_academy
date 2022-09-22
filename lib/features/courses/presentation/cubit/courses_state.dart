part of 'courses_cubit.dart';

abstract class CoursesState {
  const CoursesState();
}

class AuthInitial extends CoursesState {}

class LoadingState extends CoursesState {}

class GotCoursesState extends CoursesState {
  final CourseModel courses;

  GotCoursesState(this.courses);
}
class ErrorState extends CoursesState {
  final message;

  ErrorState(this.message);
}
