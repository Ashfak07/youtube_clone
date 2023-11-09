import 'package:flutter/material.dart';
import 'package:youtube/data.dart';
import 'package:youtube/widget/top_scrolling.dart';

import '../widget/custom_shorts_container.dart';
import '../widget/custom_video_container.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

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
                        height: 50,
                        child: ListView.builder(
                            itemCount: 8,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final TopScrolling = topScrolling[index];
                              return TopScrollingContainer(
                                topScrolling: TopScrolling,
                              );
                            }),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/jungleerummy.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 7, left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        '''Junglee Rummy is the best rummy app available on the market. It is super-smooth,lightweight and user-friendly. You can play rummy by
                                                            
                                                            ''',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.more_vert),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                    onPressed: () {}, child: Text('Watch')),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Install',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 13, 101, 173)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'shorts',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    child: ListView.builder(
                                        clipBehavior: Clip.hardEdge,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            CustomShortsContainer()),
                                  ),
                                  // Container(
                                  //     height: 200, child: CustomVideoContainer()),
                                  // Container(
                                  //     height: 200, child: CustomVideoContainer()),
                                  // Container(
                                  //     height: 200, child: CustomVideoContainer()),
                                  // Container(
                                  //     height: 200, child: CustomVideoContainer()),
                                  // Container(
                                  //     height: 200, child: CustomVideoContainer()),
                                  // SizedBox(
                                  //   height: 20,
                                  //     // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 60),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: video.length, (context, index) {
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
          ),
        ));
  }
}
