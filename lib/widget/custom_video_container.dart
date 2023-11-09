import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/data.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube/view/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomVideoContainer extends StatelessWidget {
  const CustomVideoContainer({super.key, required this.video, this.onTap});

  final Video video;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read(selectedVideoProvider).state = video;
        context
            .read(MiniplayerControllerProvider)
            .state
            .animateToHeight(state: PanelState.MAX);
        if (onTap != null) onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(video.thumbnailImage),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                        // width: 20,
                        // height: 20,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(video.duration),
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: Text(
                            video.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                            child: Text(
                              '${video.author.userName}.${video.viewcount}views.${timeago.format(video.timestamp)}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
