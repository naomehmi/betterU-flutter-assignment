import 'package:better_u/models/objects/post.dart';
import 'package:better_u/models/objects/user.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ForumPost extends StatefulWidget {
  ForumPost({super.key, required this.post});

  Post post;

  @override
  State<ForumPost> createState() => _ForumPostState();
}

class _ForumPostState extends State<ForumPost> {
  User? user;
  int? replies;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      user = Provider.of<UserManagement>(context)
          .allUsers
          .firstWhere((element) => element.email == widget.post.userEmail);
      replies = Provider.of<ForumManagement>(context)
          .allForums
          .where(
              (element) => element.reply && element.replyToId == widget.post.id)
          .length;
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.purple[200]!,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(user!.profilePic),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user!.firstName} ${user!.lastName}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user!.role,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.post.content,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                Consumer<UserManagement>(
                  builder: (context, user, child) => Row(
                    children: [
                      IconButton(
                        visualDensity: const VisualDensity(horizontal: -4),
                        iconSize: 20,
                        icon: const Icon(Icons.thumb_up),
                        color: user.loggedInUser.likedPosts.contains(widget.post.id) ? Colors.purple[200] : Colors.grey[400],
                        onPressed: () {
                          if(user.loggedInUser.likedPosts.contains(widget.post.id)){
                            user.loggedInUser.likedPosts.remove(widget.post.id);
                            widget.post.likes--;
                          } else {
                            user.loggedInUser.likedPosts.add(widget.post.id);
                            widget.post.likes++;
                          }
                          setState(() {
                            
                          });
                        },
                      ),
                      Text(
                        '${widget.post.likes} likes',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      visualDensity: const VisualDensity(horizontal: -4),
                      iconSize: 20,
                      icon: const Icon(Icons.comment),
                      color: Colors.grey[400],
                      onPressed: () {},
                    ),
                    Text(
                      '$replies ${replies == 1 ? "reply" : "replies"}',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.schedule,
                      size: 20,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      timeago.format(DateTime.now().subtract(
                          DateTime.now().difference(widget.post.time))),
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ])
            ],
          ),
        ),
      );
    });
  }
}
