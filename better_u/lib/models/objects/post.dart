class Post {
  Post({
    required this.id,
    required this.userEmail,
    required this.reply,
    this.replyToId,
    required this.likes,
    required this.time,
    required this.content
  });

  int id;
  String userEmail;
  bool reply;
  int? replyToId;
  int likes;
  DateTime time;
  String content;
}