part of 'video_cubit.dart';

abstract class VideoState {
  const VideoState();
}

class VideoInitial extends VideoState {}

class LoadingState extends VideoState {}

class GotVideoState extends VideoState {
  final Lecture lecture;

  GotVideoState(this.lecture);
}
class ErrorState extends VideoState {
  final message;

  ErrorState(this.message);
}
