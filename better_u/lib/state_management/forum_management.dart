import 'package:better_u/models/objects/post.dart';
import 'package:flutter/material.dart';

class ForumManagement extends ChangeNotifier {
  List<Post> allForums = [ // posts are sorted in reverse
    Post(
      id: 3, 
      userEmail: 'coolguy@gmail.com', 
      reply: true, 
      replyToId : 2, 
      likes: 10, 
      time: DateTime(2024, 5, 19, 11, 28),
      content: 'Slay Queen!'
    ),
    Post(
      id: 2, 
      userEmail: 'emmastone@gmail.com', 
      reply: false, 
      likes: 25, 
      time: DateTime(2024, 5, 19, 11, 7),
      content: 'This app is so great! I have lost 5kg in a month! I love it'
    ),
    Post(
      id: 1,
      userEmail: 'coolguy@gmail.com',
      reply: false,
      likes: 10,
      time: DateTime(2024, 5, 18, 12, 20),
      content: 'Don’t forget to do the warm up and cool down guys!'
    )
  ];

  int nextId = 4; // to generate post id

  void newPost(email, reply, content){
    allForums.insert(0, Post(id: nextId, userEmail: email, reply: reply, likes: 0, time: DateTime.now(), content: content));
    nextId++;
    print(allForums[0].userEmail);
    print(allForums[0].content);
    notifyListeners();
  }
}