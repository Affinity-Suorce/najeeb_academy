import 'package:bloc/bloc.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/video_player/data/video_repository.dart';
part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepositories _VideoRepositories;
  VideoCubit(this._VideoRepositories) : super(VideoInitial());
  Future<void> getVideo(String videoId) async {
    emit(LoadingState());
    final either = await _VideoRepositories.getVideo(videoId);
    either.fold((error) async {
      final errorMessage = getErrorMessage(error);
      emit(ErrorState(errorMessage));
    }, (data) {
      emit(GotVideoState(data));
    });
  }
}
