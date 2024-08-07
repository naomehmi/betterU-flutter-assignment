import 'package:better_u/models/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:better_u/models/drawer/drawer.dart';
import 'package:better_u/screens/main/community.dart';
import 'package:better_u/screens/main/home.dart';
import 'package:better_u/screens/main/profile.dart';
import 'package:better_u/screens/main/progress_tracker.dart';
import 'package:better_u/screens/onboarding/onboarding_page.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_u/models/app_bars/custom_appbar.dart';

class BetterU extends StatefulWidget {
  BetterU({
    super.key,
    this.idx
  });

  int? idx;

  @override
  State<BetterU> createState() => _BetterUState();
}

class _BetterUState extends State<BetterU> {
  int screenIdx = 0;

  @override
  void initState() {
    screenIdx = widget.idx ?? 0;
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List screens = [
    const Home(),
    const ProgressTracker(),
    const Community(),
    const Profile()
  ];

  void changeIdx(int idx) {
    setState(() {
      screenIdx = idx;
    });
  }

  void clickedLogout(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: const Text('No')
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("You have successfully been logged out!"),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(30),
                  duration: Duration(seconds: 2),
                ));
                Provider.of<UserManagement>(context, listen: false).userLogout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const OnboardingPage()),
                  (Route<dynamic> route) => false,
                );
              }, 
              child: const Text('Yes'))
          ],
        );
      }
    );
  }

  String? appBarHeader (){
    switch (screenIdx){
      case 0:
        return "Hi, ${Provider.of<UserManagement>(context, listen: false).loggedInUser.firstName}!";
      case 1:
        return "${Provider.of<UserManagement>(context, listen: false).loggedInUser.firstName}'s Progress Tracker";
      case 2:
        return "Community Posts";
      case 3:
        return "Profile";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserManagement>(context, listen: false)
            .loggedInUser
            .firstName ==
        'User') {
      return const OnboardingPage();
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          _scaffoldKey,
          appBarHeader()!,
          Provider.of<UserManagement>(context, listen: false)
              .loggedInUser
              .profilePic),
      body: screens[screenIdx],
      bottomNavigationBar: BotNavBar(
        curIdx: screenIdx,
        changeIdx: changeIdx,
      ),
      drawer: CustomDrawer(
        changeIdx: changeIdx,
        clickedLogout: clickedLogout,
      ),
    );
  }
}
