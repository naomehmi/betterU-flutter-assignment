import 'package:better_u/main_app/better_u.dart';
import 'package:better_u/screens/content/programs/all_programs_show.dart';
import 'package:better_u/screens/content/videos/see_all_vids.dart';
import 'package:better_u/screens/main/setting.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_u/state_management/theme_provider.dart'; 

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserManagement()),
        ChangeNotifierProvider(create: (context) => ForumManagement()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()), // Add ThemeProvider
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.themeData,
          debugShowCheckedModeBanner: false,
          home: const BetterU(),
          routes: {
            '/home': (context) => const BetterU(),
            '/all-programs': (context) => const AllProgramsShow(),
            '/all-videos': (context) => const AllVideosShow(),
            '/settings': (context) => const Setting(),
          },
        );
      },
    );
  }
}

