import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/app/widgets/bottom_sheet_container.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/video_player/presentation/cubit/video_cubit.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/bottom_section.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_files_container.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    Key? key,
    required this.lectureSubject,
    required this.lecture,
    required this.lectureIndex,
  }) : super(key: key);
  final Lecture lecture;
  final Subject lectureSubject;
  final int lectureIndex;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController controller;
  late final VideoCubit videoCubit;
  String defaultStream = 'https://www.youtube.com/watch?v=dfmK3dIihXY';
  bool isFullScreen = false;
  int customLectureIndex = 0;

  @override
  void initState() {
    super.initState();
    customLectureIndex = widget.lectureIndex;
    _initController("https://www.youtube.com/watch?v=AjWfY7SnMBI");
    videoCubit = BlocProvider.of<VideoCubit>(context);
    videoCubit.getVideo(widget.lecture.id.toString());
  }

  void getVideo(String lectureId) {
    videoCubit.getVideo(lectureId);
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCubit, VideoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingState) {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is ErrorState) {
            return ErrorOccuredTextWidget(
              message: state.message,
              fun: () {
                return BlocProvider.of<VideoCubit>(context)
                    .getVideo(widget.lecture.id.toString());
              },
            );
          } else if (state is GotVideoState) {
            Lecture lecture = state.lecture;
            if (controller.initialVideoId !=
                YoutubePlayer.convertUrlToId(lecture.videoUrl ?? "")) {
              _initController(lecture.videoUrl ?? "");
            }
            debugPrint("lectureIdIs:${lecture.id}");
            return YoutubePlayerBuilder(
                onEnterFullScreen: () => isFullScreen = true,
                onExitFullScreen: () => isFullScreen = false,
                player: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  bottomActions: controller.value.isFullScreen
                      ? [
                          FullScreenButton(),
                          const PlaybackSpeedButton(),
                          ProgressBar(isExpanded: true),
                          CurrentPosition(),
                          RemainingDuration(),
                        ]
                      : [
                          CurrentPosition(),
                          RemainingDuration(),
                          ProgressBar(isExpanded: true),
                          const PlaybackSpeedButton(),
                        ],
                ),
                builder: (context, player) {
                  return Scaffold(
                    backgroundColor: Colors.grey.shade900,
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        BottomSheetContainer(
                          child: VideoFilesContainer(
                              lectureName: widget.lecture.name!,
                              lectureFiles: widget.lecture.filesPdf ?? []),
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
                                // print(
                                //     "lectureIndex:${widget.lectureIndex}lectureSubject.lectures!.length:${widget.lectureSubject.lectures!.length}indexIs:$index");
                                if (index == -1) {
                                  videoCubit.getVideo(widget
                                      .lectureSubject
                                      .lectures![widget.lectureIndex == 0
                                          ? widget.lectureSubject.lectures!
                                                  .length -
                                              1
                                          : widget.lectureIndex - 1]
                                      .id
                                      .toString());
                                } else if (index == 1) {
                                  videoCubit.getVideo(widget
                                      .lectureSubject
                                      .lectures![widget.lectureIndex ==
                                              widget.lectureSubject.lectures!
                                                  .length
                                          ? 0
                                          : widget.lectureIndex + 1]
                                      .id
                                      .toString());
                                }
                                // _ChangeVideo(stream2);
                              },
                            ),
                            VideoPageBottomSection(
                                subject: widget.lectureSubject,
                                lecture: widget.lecture,
                                lectureIndex: customLectureIndex,
                                controller: controller,
                                changeVideo: (index) {
                                  customLectureIndex = index;
                                  videoCubit.getVideo(widget
                                      .lectureSubject.lectures![index].id
                                      .toString());
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return ErrorOccuredTextWidget(
            fun: () {
              return BlocProvider.of<VideoCubit>(context)
                  .getVideo(widget.lecture.id.toString());
            },
          );
        });
  }
}
