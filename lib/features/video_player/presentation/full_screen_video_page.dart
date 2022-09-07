import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/quality_selector_widget.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends StatefulWidget {
  const FullScreenVideoPage({
    Key? key,
    required this.changeVideo,
    required this.controller,
  }) : super(key: key);
  final VideoPlayerController controller;
  final Function(int index)? changeVideo;
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
                    child: widget.controller.value.isInitialized
                        ? Container(
                            alignment: Alignment.topCenter,
                            child: VideoPlayer(widget.controller),
                          )
                        : const Center(
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: AppColors.lightGrey1,
                                )))),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: VideoProgressIndicator(
                widget.controller,
                allowScrubbing: true,
                padding: const EdgeInsets.all(0),
                colors: const VideoProgressColors(
                    bufferedColor: Colors.grey,
                    backgroundColor: Colors.black,
                    playedColor: AppColors.indigo),
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: visible,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
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
                        showDialog(
                            context: context,
                            builder: (context) => QualitySelectorWidget(
                                  changeVideo: widget.changeVideo,
                                ));
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
                            widget.changeVideo!(1);
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
                            widget.changeVideo!(-1);
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      widget.controller.value.duration.inHours != 0
                          ? widget.controller.value.duration.inHours.toString()
                          : '${widget.controller.value.duration.inMinutes}:${widget.controller.value.duration.inSeconds} / ',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 22, height: 1.1),
                    ),
                    Text(
                      widget.controller.value.duration.inHours != 0
                          ? widget.controller.value.position.inHours.toString()
                          : '${widget.controller.value.position.inMinutes}:${widget.controller.value.position.inSeconds}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 22, height: 1.1),
                    ),
                    const SizedBox(
                      width: 14,
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
