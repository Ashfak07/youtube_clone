import 'package:flutter/material.dart';
import 'package:youtube/data.dart';

class TopScrollingContainer extends StatelessWidget {
  const TopScrollingContainer({super.key, required this.topScrolling});
  final Topscrolling topScrolling;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        semanticContainer: true,
        margin: EdgeInsets.only(top: 1, bottom: 1),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(topScrolling.category),
        )),
      ),
    );
  }
}
