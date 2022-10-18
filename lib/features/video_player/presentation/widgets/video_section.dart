import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({
    Key? key,
    required this.changeVideo,
    required this.controller,
    required this.player,
  }) : super(key: key);

  final YoutubePlayerController controller;
  final Widget player;
  final Function(int index)? changeVideo;

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
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
                child: Container(
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: AspectRatio(
                          aspectRatio: 16 / 9, child: widget.player)),
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    widget.controller.toggleFullScreenMode();
                  },
                  child: const Icon(
                    CupertinoIcons.fullscreen,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                InkWell(
                  onTap: () {
                    
                    // showDialog(
                    //     context: context,
                    //     builder: (context) => QualitySelectorWidget(
                    //         changeVideo: widget.changeVideo));
                  },
                  child: const Icon(
                    CupertinoIcons.settings_solid,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    widget.changeVideo!(1);
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.controller.value.isPlaying
                          ? widget.controller.pause()
                          : widget.controller.play();
                    });
                  },
                  child: Icon(
                    widget.controller.value.isPlaying
                        ? CupertinoIcons.play_arrow_solid
                        : CupertinoIcons.pause_fill,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {
                    widget.changeVideo!(-1);
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                const SizedBox(
                  width: 14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
