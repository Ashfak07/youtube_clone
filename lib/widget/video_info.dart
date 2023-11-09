import 'package:flutter/material.dart';
import 'package:youtube/data.dart';
import 'package:timeago/timeago.dart' as timeago;

class videoInfo extends StatelessWidget {
  const videoInfo({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(video.title),
          Text('${video.viewcount} views .${timeago.format(video.timestamp)}'),
          Divider(),
          actionsRow(
            video: video,
          ),
          Divider(),
          authorInfo(user: video.author),
          Divider(),
        ],
      ),
    );
  }
}

class actionsRow extends StatelessWidget {
  const actionsRow({super.key, required this.video});
  final Video video;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAction(context, Icons.thumb_up_alt_outlined, video.likes),
        _buildAction(context, Icons.thumb_down_alt_outlined, video.dislikes),
        _buildAction(context, Icons.reply_sharp, 'Share'),
        _buildAction(context, Icons.download_outlined, "Download"),
        _buildAction(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }
}

Widget _buildAction(BuildContext, IconData icon, String label) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        Icon(icon),
        SizedBox(
          height: 6,
        ),
        Text(label)
      ],
    ),
  );
}

class authorInfo extends StatelessWidget {
  const authorInfo({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(user.profileImage),
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
                  user.userName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                Flexible(
                  child: Text(
                    '${user.subscribers} Subscribers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'SUBSCRIBE',
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
