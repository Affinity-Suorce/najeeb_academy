import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/app/widgets/bottom_sheet_container.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/bottom_section.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_files_container.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_section.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    Key? key,
    // required this.subject,
    @pathParam required this.id,
  }) : super(key: key);
  final String id;
  String get subject => id;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? controller;
  List<bool> states = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  // String defaultStream =
  //     'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';
  // String stream2 =
  //     'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';
  // String stream3 =
  // 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';

  String defaultStream = 'https://www.youtube.com/watch?v=ywB7HERXFaI';
  String stream2 = 'https://www.youtube.com/watch?v=ywB7HERXFaI';
  String stream3 = 'https://www.youtube.com/watch?v=ywB7HERXFaI';

  @override
  void initState() {
    super.initState();
    _initController(defaultStream);
  }

  void _initController(String link) {
    controller = VideoPlayerController.network(
      link,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        controller!.play();
        //   seekTo(int.parse(widget.playlist.elements[currentClipIndex].Bal));
        //   seeking = false;
        // });
      });
  }

  void _ChangeVideo(String videoPath) async {
    if (controller == null) {
      // If there was no controller, just create a new one
      _initController(videoPath);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller!.dispose();

      // Initing new controller
      _initController(videoPath);
    });

    // controller?.addListener(() {
    //   setState(() {
    //     _playBackTime = _controller?.value.position.inSeconds;
    //   });
    // });
    // _initializeVideoPlayerFuture = _controller?.initialize().then((_) {
    // _controller?.seekTo(newCurrentPosition!);
    // _controller?.play();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: controller!,
                changeVideo: (index) {
                  //index == 1 >> next video / index == -1 prevrious video
                  //index == 10 >> 360p / index == 20 >> 480p / index == 30 >> 720p
                  if (index <= 1) {
                    states = states.map((e) => false).toList();
                    // states[index] = true;
                  }
                  _ChangeVideo(stream2);
                },
              ),
              VideoPageBottomSection(
                  subject: widget.subject,
                  states: states,
                  controller: controller!,
                  changeVideo: (index) {
                    states = states.map((e) => false).toList();
                    states[index] = true;
                    _ChangeVideo(stream2);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
