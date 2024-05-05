import 'package:better_u/state_management/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget HomeAppBar() {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 226, 189, 255),
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 20,
              //backgroundColor: Colors.grey[300],
              backgroundImage:
                  AssetImage('../assets/other/profile-picture.jpg'),
            ),
          ),
          const SizedBox(width: 8),
          Consumer<UserManagement>(builder: (context, user, child) {
            return Text('Hi, ${user.loggedInUser.firstName}!',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
          }),
        ],
      ),
    ),
  );
}
