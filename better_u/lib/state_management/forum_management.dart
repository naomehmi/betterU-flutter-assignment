import 'package:better_u/models/objects/post.dart';
import 'package:flutter/material.dart';

class ForumManagement extends ChangeNotifier {
  List<Post> allForums = [
    Post(
      id: 1, 
      userEmail: 'emmastone@gmail.com', 
      reply: false, 
      likes: 25, 
      time: DateTime(2024, 5, 19, 11, 7),
      content: 'This app is so great! I have lost 5kg in a month! I love it'
    ),
    Post(
      id: 2, 
      userEmail: 'coolguy@gmail.com', 
      reply: true, 
      replyToId : 1, 
      likes: 10, 
      time: DateTime(2024, 5, 19, 11, 28),
      content: 'Slay Queen!'
    ),
    Post(
      id: 3,
      userEmail: 'coolguy@gmail.com',
      reply: false,
      likes: 10,
      time: DateTime(2024, 5, 18, 12, 20),
      content: 'Don’t forget to do the warm up and cool down guys!'
    )
  ];
}