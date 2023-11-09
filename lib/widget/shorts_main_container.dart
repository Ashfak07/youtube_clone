import 'package:flutter/material.dart';
import 'package:youtube/widget/shorts_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsMainContainer extends StatelessWidget {
  ShortsMainContainer({super.key, required this.short});
  final Shorts short;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'bvmcyTucMhE',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      hideControls: true,
      mute: true,
      controlsVisibleAtStart: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(
                height: 655,
                width: 500,
                color: Colors.black,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: YoutubePlayer(
                          showVideoProgressIndicator: true,
                          controller: _controller),
                    )),
              ),
            ),
            Positioned(
              right: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  _buildAction(context, Icons.thumb_up_alt, short.likes),
                  SizedBox(
                    height: 40,
                  ),
                  _buildAction(context, Icons.thumb_down_alt, short.dislikes),
                  SizedBox(
                    height: 40,
                  ),
                  _buildAction(context, Icons.comment, short.comments),
                  SizedBox(
                    height: 40,
                  ),
                  _buildAction(context, Icons.share, 'share'),
                  SizedBox(
                    height: 40,
                  ),
                  _buildAction(context, Icons.repeat, 'remix'),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget _buildAction(BuildContext, IconData icon, String label) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [Icon(icon), Text(label)],
    ),
  );
}
