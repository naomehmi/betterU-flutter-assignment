import 'package:better_u/models/objects/user.dart';
import 'package:better_u/screens/main/editprofilepage.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  double _getProgressPercentage(String role) {
    switch (role) {
      case 'Rookie':
        return 0.25;
      case 'Intermediate':
        return 0.50;
      case 'Advanced':
        return 1.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Consumer<UserManagement>(
              builder: (context, userManagement, child) {
                User currentUser = userManagement.loggedInUser;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 226, 189, 255),
                          width: 5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(currentUser.profilePic),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${currentUser.firstName} ${currentUser.lastName}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color.fromARGB(255, 139, 93, 175), width: 2)
                                ),
                                child: LinearProgressIndicator(
                                  value: _getProgressPercentage(currentUser.role),
                                  backgroundColor: Colors.white,
                                  color: const Color.fromARGB(255, 226, 189, 255),
                                  borderRadius: BorderRadius.circular(10),
                                  minHeight: 15,
                                ),
                              ),
                              Positioned(
                                top: -5,
                                left:  _getProgressPercentage(currentUser.role) * MediaQuery.of(context).size.width - 25,
                                child: const Icon(Icons.star, color: Color.fromARGB(255, 250, 225, 0), size: 30, weight: 25, fill: 1,)
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            currentUser.role,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "email",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  Consumer<UserManagement>(
                    builder: (context, userManagement, child) {
                      return Text(
                        userManagement.loggedInUser.email,
                        style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 196, 119, 255)),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "member since",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  Consumer<UserManagement>(
                    builder: (context, userManagement, child) {
                      DateTime memberSinceDate = userManagement.loggedInUser.memberSince;
                      String memberSince = DateFormat.yMMMMd().format(memberSinceDate);
                      return Text(
                        memberSince,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 196, 119, 255),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text( 
                    "pronouns",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  Consumer<UserManagement>(
                    builder: (context, userManagement, child) {
                      String pronouns = userManagement.loggedInUser.pronouns;
                      return Text(
                        pronouns,
                        style: const TextStyle(
                          fontSize: 16, 
                          color: Color.fromARGB(255, 196, 119, 255)
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfilePage()),
              );
            },
            child: const Center(
              child: Text(
                "Edit Profile",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Color.fromARGB(255, 170, 140, 36), 
                  fontSize: 16, 
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromARGB(255, 170, 140, 36)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
