import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:youtube/data.dart';
import 'package:youtube/view/home_screen.dart';
import 'package:youtube/widget/custom_video_container.dart';
import 'package:youtube/widget/video_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Consumer(builder: (context, watch, _) {
                  final selectedVideo = watch(selectedVideoProvider).state;
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: selectedVideo!.id,
                    flags: YoutubePlayerFlags(
                      autoPlay: true,
                      controlsVisibleAtStart: true,
                    ),
                  );
                  return Column(
                    children: [
                      YoutubePlayer(
                          showVideoProgressIndicator: true,
                          controller: _controller),

                      // const LinearProgressIndicator(
                      //   value: 0.4,
                      //   valueColor: AlwaysStoppedAnimation(Colors.red),
                      // ),
                      videoInfo(video: selectedVideo),
                    ],
                  );
                }),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final Video = video[index];
                return CustomVideoContainer(
                    video: Video,
                    onTap: () => _scrollController!.animateTo(0,
                        duration: Duration(microseconds: 200),
                        curve: Curves.easeIn));
              }, childCount: video.length))
            ],
          ),
        ),
      ),
    );
  }
}
