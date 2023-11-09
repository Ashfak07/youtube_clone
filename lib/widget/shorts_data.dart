class User {
  final String userName;
  final String profileImage;

  User(this.userName, this.profileImage);
}

User sUser = User('Ashfak', 'assets/images/logo.png');

class Shorts {
  final String id;
  final User author;
  final String title;
  final String likes;
  final String dislikes;
  final String comments;
  final String share;
  final String remix;

  Shorts(this.id, this.author, this.title, this.likes, this.dislikes,
      this.comments, this.share, this.remix);
}

final List<Shorts> shorts = [
  Shorts('L5kIXRdwGAI', sUser, 'katana Vs Bullet', '200k', '1k', '2.6k', '1k',
      'remix'),
  Shorts('hRUJ41rdp4M', sUser, '1 Year of Coding #programming', '100k', '400',
      '3.6k', '2k', 'remix'),
  Shorts('bvmcyTucMhE', sUser, 'BGMI', '200k', '1k', '2.6k', '1k', 'remix'),
];
