import 'package:better_u/data/all_users.dart';
import 'package:better_u/data/logged_in_user.dart';
import 'package:better_u/screens/home.dart';
import 'package:better_u/screens/profile.dart';
import 'package:better_u/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AllUsers()),
    ChangeNotifierProvider(create: (context) => LoggedInUser())
  ], child: const MyApp()));
}

// whenever your initialization is completed, remove the splash screen:
// FlutterNativeSplash.remove();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
      },
      home: const OnboardingPage(),
    );
  }
}

//TEST