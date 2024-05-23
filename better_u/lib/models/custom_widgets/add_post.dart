import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  AddPost({
    super.key,
    required this.function
  });

  Function function;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool isButtonDisabled = true;

  TextEditingController content = TextEditingController();

  Color colorData = Colors.purple[200]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: (){Navigator.pop(context);},),
        title: const Text("New Post", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isButtonDisabled ? Colors.purple[200] : Colors.grey[300],
                ),
                onPressed: (){
                  if(!isButtonDisabled){
                    widget.function(false, content.text);
                  }
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
                      child: TextField(
                        onChanged: (val){
                          if(val.isNotEmpty){
                            isButtonDisabled = false;
                          } else {
                            isButtonDisabled = true;
                          }
                          setState(() {});
                        },
                        controller: content,
                        scrollPadding: const EdgeInsets.all(0),
                        style: const TextStyle(
                          fontSize: 16
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.multiline,
                        maxLines: 25,
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