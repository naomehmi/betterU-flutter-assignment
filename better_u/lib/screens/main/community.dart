import 'package:better_u/models/custom_widgets/add_post.dart';
import 'package:better_u/models/custom_widgets/forum_post.dart';
import 'package:better_u/models/objects/post.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  void refreshCommunityPost(replyOrNot, content){
    String email = Provider.of<UserManagement>(context, listen: false).loggedInUser.email;
    Provider.of<ForumManagement>(context, listen: false).newPost(email, false, content);
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Post> allPosts = Provider.of<ForumManagement>(context, listen: false).allForums.where((element) => !element.reply).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...allPosts.map((e) => ForumPost(post: e))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost(function: refreshCommunityPost)));
              },
              backgroundColor: Colors.purple[200],
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add_comment_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
    );
  }
}