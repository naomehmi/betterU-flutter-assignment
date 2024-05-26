import 'package:better_u/main_app/better_u.dart';
import 'package:better_u/screens/content/programs/all_programs_show.dart';
import 'package:better_u/screens/content/videos/see_all_vids.dart';
import 'package:better_u/screens/main/setting.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserManagement()),
    ChangeNotifierProvider(create: (context) => ForumManagement())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BetterU(),
      routes: {
        '/home': (context) => const BetterU(),
        '/all-programs': (context) => const AllProgramsShow(),
        '/all-videos': (context) => const AllVideosShow(),
        '/settings': (context) => const Setting()
      },
    );
  }
}
