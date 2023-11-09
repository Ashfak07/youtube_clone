import 'package:flutter/material.dart';
import 'package:youtube/data.dart';
import 'package:youtube/widget/shorts_data.dart';
import 'package:youtube/widget/shorts_main_container.dart';

class ShortsScreen extends StatelessWidget {
  ShortsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              SizedBox(
                width: 230,
                height: 370,
              ),
              Icon(Icons.search),
              SizedBox(
                width: 30,
              ),
              Icon(Icons.camera_alt_outlined),
              SizedBox(
                width: 30,
              ),
              Icon(Icons.more_vert)
            ],
          ),
          body: ListView.builder(
              itemCount: video.length,
              itemBuilder: (context, index) => ShortsMainContainer(
                    short: shorts[index],
                  ))),
    );
  }
}
