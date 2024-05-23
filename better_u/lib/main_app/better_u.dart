import 'package:better_u/models/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:better_u/models/custom_widgets/add_post.dart';
import 'package:better_u/models/drawer/drawer.dart';
import 'package:better_u/screens/main/community.dart';
import 'package:better_u/screens/main/home.dart';
import 'package:better_u/screens/main/profile.dart';
import 'package:better_u/screens/main/progress_tracker.dart';
import 'package:better_u/screens/onboarding/onboarding_page.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_u/models/app_bars/custom_appbar.dart';

class BetterU extends StatefulWidget {
  const BetterU({
    super.key,
  });

  @override
  State<BetterU> createState() => _BetterUState();
}

class _BetterUState extends State<BetterU> {
  int screenIdx = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List screens = [
    const Home(),
    const ProgressTracker(),
    const Community(),
    const Profile()
  ];

  late List headings;

  void changeIdx(int idx) {
    setState(() {
      screenIdx = idx;
    });
  }

  void clickedLogout() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("You have successfully been logged out!"),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30),
      duration: Duration(seconds: 2),
    ));
    setState(() {
      Provider.of<UserManagement>(context, listen: false).userLogout();
    });
  }

  @override
  void initState() {
    headings = [
      "Hi, ${Provider.of<UserManagement>(context, listen: false).loggedInUser.firstName}!",
      "${Provider.of<UserManagement>(context, listen: false).loggedInUser.firstName}'s Progress Tracker",
      "Community Posts",
      "Profile",
    ];
    super.initState();
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
          headings[screenIdx],
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
