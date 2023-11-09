import 'package:flutter/material.dart';
import 'package:youtube/data.dart';
import 'package:youtube/widget/custom_video_container.dart';
import 'package:youtube/widget/subscription_custom_container.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              floating: true,
              leading: Image.asset('assets/images/logo.png'),
              actions: [
                Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Colors.brown,
                  radius: 13,
                ),
                SizedBox(width: 15)
              ],
            ),
            SliverList.list(children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: 119,
                      child: ListView.builder(
                          itemCount: 10,
                          clipBehavior: Clip.hardEdge,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              SubscriptionCustomContainer()),
                    ),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  semanticContainer: true,
                                  margin: EdgeInsets.only(top: 1, bottom: 1),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('explore'),
                                  )),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ]),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 60),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: video.length,
                      (context, index) {
                final Video = video[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    CustomVideoContainer(
                      video: Video,
                    ),
                  ],
                );
              })),
            )
          ],
        )));
  }
}
