import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/video_player/enum.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatelessWidget {
  VideoSection(
      {Key? key,
      required this.changeVideo,
      required this.controller,
      this.isFullScreen = false})
      : super(key: key);

  final VideoPlayerController controller;
  final Function(int index)? changeVideo;
  final bool isFullScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isFullScreen
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade900,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Expanded(
            child: Container(
                width: double.infinity,
                child: controller.value.isInitialized
                    ? Container(
                        alignment: Alignment.topCenter,
                        child: VideoPlayer(controller),
                      )
                    : Center(
                        child: Container(
                            width: 50,
                            height: 50,
                            child: const CircularProgressIndicator(
                              color: AppColors.lightGrey1,
                            )))),
          ),
          VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            padding: EdgeInsets.all(0),
            colors: VideoProgressColors(
                bufferedColor: Colors.grey,
                backgroundColor: Colors.black,
                playedColor: AppColors.indigo),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 14,
                ),
                Text(
                  controller.value.duration.inHours != 0
                      ? controller.value.position.inHours.toString()
                      : '' +
                          controller.value.position.inMinutes.toString() +
                          ':' +
                          controller.value.position.inSeconds.toString() +
                          ' / ',
                  style:
                      TextStyle(color: Colors.white, fontSize: 20, height: 1.1),
                ),
                Text(
                  controller.value.duration.inHours != 0
                      ? controller.value.duration.inHours.toString()
                      : '' +
                          controller.value.duration.inMinutes.toString() +
                          ':' +
                          controller.value.duration.inSeconds.toString(),
                  style:
                      TextStyle(color: Colors.white, fontSize: 20, height: 1.1),
                ),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {
                    changeVideo!(-1);
                  },
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {
                    changeVideo!(1);
                  },
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.grey.shade900,
                        insetPadding: EdgeInsets.fromLTRB(1, 20, 1, 24),
                        contentPadding: EdgeInsets.fromLTRB(1, 20, 1, 24),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                changeVideo!(10);
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'منخفضة',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    '360p',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            InkWell(
                              onTap: () {
                                changeVideo!(20);
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'متوسطة',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    '480p',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            InkWell(
                              onTap: () {
                                changeVideo!(10);
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'عالية',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    '720p',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    CupertinoIcons.settings_solid,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                InkWell(
                  onTap: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight
                    ]);
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: VideoSection(
                          changeVideo: changeVideo,
                          controller: controller,
                          isFullScreen: true,
                        ),
                      ),
                    ))
                        .then((value) {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                        DeviceOrientation.portraitDown,
                        DeviceOrientation.portraitUp,
                      ]);
                    });
                  },
                  child: Icon(
                    CupertinoIcons.fullscreen,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
