class User {
  final String userName;
  final String profileImage;
  final String subscribers;

  User(
      {required this.userName,
      required this.profileImage,
      required this.subscribers});
}

User currentUser = User(
    userName: 'Ashfak',
    profileImage: 'assets/images/logo.png',
    subscribers: '100k');

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailImage;
  final String duration;
  final DateTime timestamp;
  final String viewcount;
  final String likes;
  final String dislikes;

  Video(
      {required this.id,
      required this.author,
      required this.title,
      required this.thumbnailImage,
      required this.duration,
      required this.timestamp,
      required this.viewcount,
      required this.likes,
      required this.dislikes});
}

final List<Video> video = [
  Video(
      id: 'lcw5mfJRU7I',
      author: currentUser,
      title: 'Juice WRLD - Been Hurting (Music Video)',
      thumbnailImage: 'assets/images/jcwrld.png',
      duration: '03:08',
      timestamp: DateTime(2023, 9, 7),
      viewcount: '18k',
      likes: '12k',
      dislikes: '0'),
  Video(
      id: 'bdPvE4QpgqM',
      author: currentUser,
      title: 'Cristiano Ronaldo - The Master Of Skills HD',
      thumbnailImage: 'assets/images/cr7.png',
      duration: '04:08',
      timestamp: DateTime(2023, 9, 7),
      viewcount: '400k',
      likes: '300k',
      dislikes: '0'),
  Video(
      id: 'S9bCLPwzSC0',
      author: currentUser,
      title: 'Eminem - Mockingbird [Official Music Video]',
      thumbnailImage: 'assets/images/eminem.png',
      duration: '03:08',
      timestamp: DateTime(2023, 9, 7),
      viewcount: '180k',
      likes: '120k',
      dislikes: '0'),
];

class Topscrolling {
  final String category;

  Topscrolling(this.category);
}

List<Topscrolling> topScrolling = [
  Topscrolling('all'),
  Topscrolling('gaming'),
  Topscrolling('bgmi'),
  Topscrolling('news'),
  Topscrolling('tech'),
  Topscrolling('movie'),
  Topscrolling('comedy'),
  Topscrolling('action'),
];
