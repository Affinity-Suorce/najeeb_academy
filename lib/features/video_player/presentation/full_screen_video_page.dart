import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/quality_selector_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class FullScreenVideoPage extends StatefulWidget {
  const FullScreenVideoPage({
    Key? key,
    // required this.changeVideo,
    required this.controller,
  }) : super(key: key);
  final YoutubePlayerController controller;
  // final Function(int index)? changeVideo;
  @override
  State<FullScreenVideoPage> createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late bool visible;
  @override
  void initState() {
    visible = false;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade900,
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: YoutubePlayer(
                    controller: widget.controller,
                    showVideoProgressIndicator: true,
                    bottomActions:[
                          FullScreenButton(),
                          const PlaybackSpeedButton(),
                          ProgressBar(isExpanded: true),
                          CurrentPosition(),
                          RemainingDuration(),
                        ],
                  ),
                ),
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: false,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        CupertinoIcons.fullscreen_exit,
                        color: Colors.white,
                        size: 26,
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
                        //           changeVideo: widget.changeVideo,
                        //         ));
                      },
                      child: const Icon(
                        CupertinoIcons.settings_solid,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // widget.changeVideo!(1);
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_right,
                            color: Colors.white,
                            size: 30,
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
                                ? CupertinoIcons.pause_fill
                                : CupertinoIcons.play_arrow_solid,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        InkWell(
                          onTap: () {
                            // widget.changeVideo!(-1);
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
