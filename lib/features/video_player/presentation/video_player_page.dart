import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/app/widgets/bottom_sheet_container.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/bottom_section.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_files_container.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    Key? key,
    @pathParam required this.lectureSubject,
    @pathParam required this.lecture,
    @pathParam required this.lectureIndex,
    @pathParam required this.id,
  }) : super(key: key);
  final String id;
  final Lecture lecture;
  final Subject lectureSubject;
  final int lectureIndex;
  String get subject => id;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController controller;
  List<bool> states = [];
  String defaultStream = 'https://www.youtube.com/watch?v=dfmK3dIihXY';

  @override
  void initState() {
    super.initState();
    _initController(defaultStream);
    states = List.generate(widget.lectureSubject.lectures!.length, (index) {
      if (index == widget.lectureIndex) return true;
      return false;
    });
  }

  void _initController(String link) {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(link)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  // void _initController(String link) {
  //   controller = VideoPlayerController.network(
  //     link,
  //     videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
  //   )
  //     ..addListener(() => setState(() {}))
  //     ..setLooping(true)
  //     ..initialize().then((_) {
  //       setState(() {});
  //       controller!.play();
  //       //   seekTo(int.parse(widget.playlist.elements[currentClipIndex].Bal));
  //       //   seeking = false;
  //       // });
  //     });
  // }

  // void _ChangeVideo(String videoPath) async {
  //   if (controller == null) {
  //     // If there was no controller, just create a new one
  //     _initController(videoPath);
  //   }
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     // await controller!.dispose();

  //     // Initing new controller
  //     _initController(videoPath);
  //   });

  //   // controller?.addListener(() {
  //   //   setState(() {
  //   //     _playBackTime = _controller?.value.position.inSeconds;
  //   //   });
  //   // });
  //   // _initializeVideoPlayerFuture = _controller?.initialize().then((_) {
  //   // _controller?.seekTo(newCurrentPosition!);
  //   // _controller?.play();
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          bottomActions: controller.value.isFullScreen
              ? [
                  FullScreenButton(),
                  PlaybackSpeedButton(),
                  ProgressBar(isExpanded: true),
                  CurrentPosition(),
                  RemainingDuration(),
                ]
              : [
                  CurrentPosition(),
                  RemainingDuration(),
                  ProgressBar(isExpanded: true),
                ],
        ),
        builder: (context, player) {
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                const BottomSheetContainer(
                  child: VideoFilesContainer(),
                ).showAsBottomSheet<DateTime>(
                  context,
                  isScrollControlled: true,
                );
              },
              child: const Icon(CupertinoIcons.doc_on_doc),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    VideoSection(
                      controller: controller,
                      player: player,
                      changeVideo: (index) {
                        //index == 1 >> next video / index == -1 prevrious video
                        //index == 10 >> 360p / index == 20 >> 480p / index == 30 >> 720p
                        if (index <= 1) {
                          states = states.map((e) => false).toList();
                          // states[index] = true;
                        }
                        // _ChangeVideo(stream2);
                      },
                    ),
                    VideoPageBottomSection(
                        subject: widget.lectureSubject,
                        lecture: widget.lecture,
                        states: states,
                        controller: controller,
                        changeVideo: (index) {
                          states = states.map((e) => false).toList();
                          states[index] = true;
                          // _ChangeVideo(stream2);
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
