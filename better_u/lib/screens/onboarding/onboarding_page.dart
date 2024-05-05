import 'package:better_u/models/custom_widgets/login_signup_button.dart';
import 'package:better_u/screens/onboarding/onboarding_contents.dart';
import 'package:better_u/screens/user_related/login_modal.dart';
import 'package:better_u/screens/user_related/sign_up.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < contents.length - 1) {
      setState(() {
        currentIndex++;
      });
      _controller.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to the next screen
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignUp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 300,
                        ),
                        Text(
                          contents[i].title,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
            Column(
              // login button
              children: [
                if (currentIndex == contents.length - 1)
                  LoginAndSignUpButton(
                    text: "Login",
                      onPressed: () {
                        LoginModal(context);
                      },
                      color1: const Color.fromARGB(255, 226, 189, 255),
                      color2: const Color.fromARGB(255, 139, 93, 175)),
                // continue && sign up button
                LoginAndSignUpButton(
                    onPressed: nextPage,
                    color1: currentIndex == contents.length - 1
                        ? const Color.fromARGB(255, 241, 230, 130)
                        : const Color.fromARGB(255, 226, 189, 255),
                    text: currentIndex == contents.length - 1 ? "Sign Up" : "Next",
                    color2: currentIndex == contents.length - 1
                        ? const Color.fromARGB(255, 170, 140, 36)
                        : const Color.fromARGB(255, 139, 93, 175)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
