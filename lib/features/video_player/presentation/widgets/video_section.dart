import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/player.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({
    Key? key,
    required this.changeVideo,
    required this.url,
    required this.id,
  }) : super(key: key);

  final Function(int index)? changeVideo;
  final String url;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.324,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child:  Player(
                    url: url,
                    id: id,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
