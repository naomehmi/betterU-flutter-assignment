import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddPost extends StatelessWidget {
  AddPost({
    super.key,
    required this.function
  });

  Function function;

  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("New Post", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[200],
                ),
                onPressed: (){
                  function(false, content.text);
                  Navigator.pop(context);
                }, 
                child: const Center(
                  child: Text(
                    "Share", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  )
                )
              ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                    backgroundImage: AssetImage(Provider.of<UserManagement>(context).loggedInUser.profilePic),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      //height: 100,
                      child: TextField(
                        controller: content,
                        scrollPadding: const EdgeInsets.all(0),
                        style: const TextStyle(
                          fontSize: 16
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        autofocus: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          border: InputBorder.none,
                          hintText: "Share your progress!",
                          hintStyle: TextStyle(
                            color: Colors.purple[200]?.withOpacity(0.8)
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}