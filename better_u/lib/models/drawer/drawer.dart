import 'package:better_u/screens/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_u/state_management/user_management.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) changeIdx;

  const CustomDrawer({Key? key, required this.changeIdx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: 
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 205, 141, 255),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/other/profile-picture.jpg'),
                    ),
                    const SizedBox(height: 15),
                    Consumer<UserManagement>(builder: (context, user, child) {
                      return Text(
                        '${user.loggedInUser.firstName} ${user.loggedInUser.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                    const Text(
                      'Rookie',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              ListTile(
                leading: const Icon(Icons.home, color: Color.fromARGB(255, 226, 189, 255)),
                title: const Text('Home'),
                onTap: () {
                  changeIdx(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart, color: Color.fromARGB(255, 226, 189, 255)),
                title: const Text('Progress Tracker'),
                onTap: () {
                  changeIdx(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.people, color: Color.fromARGB(255, 226, 189, 255)),
                title: const Text('Community'),
                onTap: () {
                  changeIdx(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle, color: Color.fromARGB(255, 226, 189, 255)),
                title: const Text('Profile'),
                onTap: () {
                  changeIdx(3);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 230),
              ListTile(
                leading: const Icon(Icons.logout, color: Color.fromARGB(255, 205, 141, 255)),
                title: const Text('Log out'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}

//testcommit
