import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/data.dart';
import 'package:youtube/view/home_main.dart';
import 'package:youtube/view/library_screen.dart';
import 'package:youtube/view/subscription_screen.dart';
import 'package:youtube/view/shorts_screen.dart';
import 'package:youtube/view/add_screen.dart';
import 'package:youtube/view/video_screen.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);
final MiniplayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
        (ref) => MiniplayerController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static double _palyerMinHeight = 60;
  int _currentSelectedIndex = 0;

  final _pages = [
    HomeMain(),
    ShortsScreen(),
    AddScreen(),
    SubscriptionScreen(),
    LibraryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          iconSize: 22,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentSelectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined), label: 'Shorts'),
            BottomNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(
                                            Icons.video_collection_rounded),
                                      ),
                                      title: Text(
                                        'create a Shorts',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(Icons.file_upload_outlined),
                                      ),
                                      title: Text(
                                        'Upload a video',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        child:
                                            Icon(Icons.settings_remote_sharp),
                                      ),
                                      title: Text(
                                        'Golive',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                    },
                    child: SizedBox(
                      height: 28,
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 46,
                      ),
                    )),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                label: 'Subscriptions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_add_outlined), label: 'Library'),
          ],
          onTap: (i) {
            setState(() {
              _currentSelectedIndex = i;
            });
          },
        ),
        body: Consumer(builder: (context, watch, _) {
          final selectedVideo = watch(selectedVideoProvider).state;
          final miniPlayerController =
              watch(MiniplayerControllerProvider).state;
          return Stack(
              children: _pages
                  .asMap()
                  .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _currentSelectedIndex != i,
                        child: screen,
                      )))
                  .values
                  .toList()
                ..add(Offstage(
                  offstage: selectedVideo == null,
                  child: Miniplayer(
                      controller: miniPlayerController,
                      minHeight: _palyerMinHeight,
                      maxHeight: MediaQuery.of(context).size.height,
                      builder: (height, percentage) {
                        if (selectedVideo == null) return SizedBox.shrink();
                        if (height <= _palyerMinHeight + 50.0)
                          return Container(
                            child: Center(
                                child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      selectedVideo.thumbnailImage,
                                      height: _palyerMinHeight - 4.0,
                                      width: 120.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                                child: Text(
                                              selectedVideo.title,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                            Flexible(
                                              child: Text(
                                                '${selectedVideo.author.userName}',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.play_arrow)),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read(selectedVideoProvider)
                                              .state = null;
                                        },
                                        icon: Icon(Icons.close)),
                                  ],
                                ),
                                const LinearProgressIndicator(
                                  value: 0.4,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.red),
                                )
                              ],
                            )),
                          );
                        return VideoScreen();
                      }),
                )));
        }));
  }
}
