import 'package:better_u/models/objects/post.dart';
import 'package:better_u/models/objects/user.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class Replies extends StatefulWidget {
  Replies({super.key, required this.post});

  Post post;

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  Widget replyFormat(User user, Post post, bool mainPost) {
    List<Post>? replies;
    if(mainPost){
      replies = Provider.of<ForumManagement>(context)
        .allForums
        .where(
            (element) => element.reply && element.replyToId == widget.post.id)
        .toList().reversed.toList();
    }
    User curUser = Provider.of<UserManagement>(context).loggedInUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(user.profilePic),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  user.role,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          post.content,
          style: const TextStyle(fontSize: 17),
        ),
        Row(children: [
          Row(
            children: [
              IconButton(
                visualDensity: const VisualDensity(horizontal: -4),
                iconSize: 20,
                icon: const Icon(Icons.thumb_up),
                color: curUser.likedPosts.contains(post.id)
                    ? Colors.purple[200]
                    : Colors.grey[400],
                onPressed: () {
                  if (curUser.likedPosts.contains(post.id)) {
                    Provider.of<ForumManagement>(context, listen: false)
                        .removeLike(post.id);
                  } else {
                    Provider.of<ForumManagement>(context, listen: false)
                        .newLike(post.id);
                  }
                  Provider.of<UserManagement>(context, listen: false)
                      .userLike(post.id);
                  setState(() {});
                },
              ),
              Text(
                '${post.likes} ${post.likes == 1 ? "like" : "likes"}',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
          if(mainPost)
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(Icons.comment, size: 20, color: Colors.grey[400]),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${replies!.length} ${replies.length == 1 ? "reply" : "replies"}',
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
                timeago.format(DateTime.now()
                    .subtract(DateTime.now().difference(post.time))),
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
        ])
      ],
    );
  }

  TextEditingController reply = TextEditingController();

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    User poster = Provider.of<UserManagement>(context)
        .allUsers
        .firstWhere((element) => element.email == widget.post.userEmail);
    User curUser = Provider.of<UserManagement>(context).loggedInUser;
    List<Post> replies = Provider.of<ForumManagement>(context)
        .allForums
        .where(
            (element) => element.reply && element.replyToId == widget.post.id)
        .toList().reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Replies"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              replyFormat(poster, widget.post, true),
              Divider(
                color: Colors.purple[200]!,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 15),
                          hintText: "Reply to ${poster.firstName}'s Post",
                          hintStyle:
                              TextStyle(color: Colors.purple.withOpacity(0.40)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple[200]!),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple[200]!),
                            borderRadius: BorderRadius.circular(50),
                          )),
                      controller: reply,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          onPressed = null;
                        } else {
                          onPressed = () {
                            Provider.of<ForumManagement>(context, listen: false)
                                .newPost(curUser.email, true, reply.text,
                                    widget.post.id);
                            FocusManager.instance.primaryFocus?.unfocus();
                            reply.text = "";
                          };
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.send),
                    color: Colors.purple[200],
                    disabledColor: Colors.grey[400],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text("Replies", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25
                ),),
              ),
              ...replies.map((e) {
                User thisUser = Provider.of<UserManagement>(context)
                    .allUsers
                    .firstWhere((element) => element.email == e.userEmail);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      replyFormat(thisUser, e, false)
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
