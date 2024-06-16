  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:better_u/state_management/user_management.dart';
  import 'package:better_u/state_management/theme_provider.dart';

  class CustomDrawer extends StatelessWidget {
  final Function(int) changeIdx;
  final Function clickedLogout;

  const CustomDrawer({
    Key? key,
    required this.changeIdx,
    required this.clickedLogout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeType;

    Color iconColor = theme == ThemeType.dark ? Colors.white : const Color.fromARGB(255, 226, 189, 255);
    Color dividerColor = theme == ThemeType.dark ? Colors.grey : const Color.fromARGB(255, 226, 189, 255);
    Color backgroundColor = theme == ThemeType.dark ? Colors.black : Colors.white;

    return Drawer(
      child: Container(
        color: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme == ThemeType.dark ? Colors.black : const Color.fromARGB(255, 205, 141, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      Provider.of<UserManagement>(context).loggedInUser.profilePic,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Consumer<UserManagement>(
                    builder: (context, user, child) {
                      return Text(
                        '${user.loggedInUser.firstName} ${user.loggedInUser.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
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
              leading: Icon(Icons.home, color: iconColor),
              title: Text('Home'),
              onTap: () {
                changeIdx(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: iconColor),
              title: Text('Progress Tracker'),
              onTap: () {
                changeIdx(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: iconColor),
              title: Text('Community'),
              onTap: () {
                changeIdx(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: iconColor),
              title: Text('Profile'),
              onTap: () {
                changeIdx(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: iconColor),
              title: Text('Setting'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            Divider(
              color: dividerColor,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: iconColor),
              title: Text('Log out'),
              onTap: () {
                clickedLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
