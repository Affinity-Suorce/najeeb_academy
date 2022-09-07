import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/video_player/presentation/full_screen_video_page.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/quality_selector_widget.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({
    Key? key,
    required this.changeVideo,
    required this.controller,
  }) : super(key: key);

  final VideoPlayerController controller;
  final Function(int index)? changeVideo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                color: Colors.black,
                child: controller.value.isInitialized
                    ? Container(
                        alignment: Alignment.topCenter,
                        child: VideoPlayer(controller),
                      )
                    : const Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: AppColors.lightGrey1,
                            )))),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              padding: const EdgeInsets.all(0),
              colors: const VideoProgressColors(
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.black,
                  playedColor: AppColors.indigo),
            ),
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => FullScreenVideoPage(
                                  changeVideo: changeVideo,
                                  controller: controller,
                                )))
                        .then((value) => {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                              ])
                            });
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
                    showDialog(
                        context: context,
                        builder: (context) =>
                            QualitySelectorWidget(changeVideo: changeVideo));
                  },
                  child: const Icon(
                    CupertinoIcons.settings_solid,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    changeVideo!(1);
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
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                  child: Icon(
                    controller.value.isPlaying
                        ? CupertinoIcons.pause_fill
                        : CupertinoIcons.play_arrow_solid,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {
                    changeVideo!(-1);
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
                Text(
                  controller.value.duration.inHours != 0
                      ? controller.value.duration.inHours.toString()
                      : '${controller.value.duration.inMinutes}:${controller.value.duration.inSeconds} / ',
                  style:
                      const TextStyle(color: Colors.white, fontSize: 20, height: 1.1),
                ),
                Text(
                  controller.value.duration.inHours != 0
                      ? controller.value.position.inHours.toString()
                      : '${controller.value.position.inMinutes}:${controller.value.position.inSeconds}',
                  style:
                      const TextStyle(color: Colors.white, fontSize: 20, height: 1.1),
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
