import 'package:http/http.dart';
import 'package:najeeb_academy/core/network/data_source.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';

class VideoDataSource {
  final Client _client;
  VideoDataSource(this._client);
  Future<Lecture> getVideo(String videoId) async {
    return dataSource(
      () => _client.get(
        Uri.parse(videoUrl(videoId)),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer Iz51G5pkejpI8oioDdIWLuZIPDJoU7sdsPuCDbFMnJudXjna47K7RItncTPAhcJi8kidt9CdFeqvbeCB'
        },
      ),
      lectureFromJson,
    );
  }
}
