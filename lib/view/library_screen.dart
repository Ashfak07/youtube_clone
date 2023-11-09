import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(slivers: [
      SliverAppBar(
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
      SliverList.list(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.history),
              ),
              Text('History'),
              SizedBox(
                width: 210,
              ),
              TextButton(onPressed: () {}, child: Text('View all'))
            ],
          ),
          Column(
            children: [
              Container(
                height: 119,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black),
                          ),
                        )),
              ),
              Divider()
            ],
          )
        ],
      ),
      SliverList.list(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.playlist_play_rounded),
              ),
              Text('Playlists'),
              SizedBox(
                width: 210,
              ),
              TextButton(onPressed: () {}, child: Text('View all'))
            ],
          ),
          Column(
            children: [
              Container(
                height: 119,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black),
                          ),
                        )),
              ),
              Divider()
            ],
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 150,
          //     child: Column(
          //       children: [Text('hi')],
          //     ),
          //   ),
          // )
        ],
      )
    ])));
  }
}
