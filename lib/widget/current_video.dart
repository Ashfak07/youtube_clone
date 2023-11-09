import 'package:flutter/material.dart';
import 'package:youtube/data.dart';

class currentVideo extends StatelessWidget {
  const currentVideo({super.key, required this.video});
  final Video video;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [buildAction(BuildContext, video.id)],
    );
  }
}

buildAction(BuildContext, String id) {
  return GestureDetector(
    onTap: () {
      Text(id);
    },
  );
}
