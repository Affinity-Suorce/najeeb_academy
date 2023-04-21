import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:pod_player/pod_player.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    required this.url,
    required this.id,
  });

  final String url;
  final int id;

  @override
  State<Player> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<Player>
    with WidgetsBindingObserver {
  late final PodPlayerController _controller;
  
  @override
  void initState() {
    mediaPlayerControllerSetUp();
    super.initState();

  }

  void mediaPlayerControllerSetUp() {
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        widget.url
      ))..initialise();
      _controller.addListener(() { 
        if(_controller.currentVideoPosition.inMinutes.compareTo(_controller.totalVideoLength.inMinutes)==0
          &&_controller.currentVideoPosition.inHours.compareTo(_controller.totalVideoLength.inHours)==0){
          DI.lectureServices.addWatchedLectureId(widget.id);
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      frameAspectRatio:16/9,
      controller: _controller,
    );
  }
}
