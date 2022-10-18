import 'package:dartz/dartz.dart';
import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/core/network/repositories.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/video_player/data/video_data_source.dart';

class VideoRepositories {
  final VideoDataSource _videoDataSource;
  VideoRepositories(this._videoDataSource);

  Future<Either<Failure, Lecture>> getVideo(String videoId) async =>
      await repository<Lecture>(
          () async => await _videoDataSource.getVideo(videoId));
}
