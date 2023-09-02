import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/features/home/bloc/home_bloc.dart';
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
  bool isLoading = false,isVideoPlaying = false;
  Size size = const Size(0.0, 0.0);

  @override
  void initState() {
    mediaPlayerControllerSetUp();
    super.initState();
  }

  void mediaPlayerControllerSetUp() {
    try {
    _controller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.youtube(widget.url),
          podPlayerConfig: const PodPlayerConfig(
            isLooping: true,
            autoPlay: true,
            videoQualityPriority: [1080,720,360,240,144]
          ))..initialise().whenComplete((){
          BlocProvider.of<HomeBloc>(context).add(SetNumberOfViewsEvent(widget.id));
          BlocProvider.of<HomeBloc>(context).add(GetNumberOfViewsEvent());
          debugPrint('Success');
      }).onError((error, stackTrace) {
      debugPrint('No Success Watched ${stackTrace.toString()}');
    });
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
        child: PodVideoPlayer(
          videoThumbnail: const DecorationImage(fit: BoxFit.cover,image: NetworkImage("http://www.hotcow.co.uk/wp-content/uploads/2017/06/video_icon.jpg")),
          matchFrameAspectRatioToVideo: true,
          matchVideoAspectRatioToFrame: true,
          alwaysShowProgressBar: true,
          controller: _controller,
        backgroundColor: Colors.transparent,
        )
        );
  }
}
