import 'package:better_u/screens/login.dart';
import 'package:better_u/screens/models/onboarding_model.dart';
import 'package:better_u/screens/signup.dart';
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
      body: Column(
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
                          fontSize: 30,
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
              if(currentIndex == contents.length - 1)
              Container(
                height: 60,
                margin: const EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    LoginModal(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 226, 189, 255)),
                    elevation: MaterialStateProperty.all<double>(0)
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 139, 93, 175)
                    ),
                  ),
                ),
              ),
              // continue && sign up button
              Container(
                height: 60,
                margin: currentIndex == contents.length - 1 ? const EdgeInsets.only(left: 60, right: 60, bottom: 60) : const EdgeInsets.all(60),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextPage,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                      return currentIndex == contents.length - 1 ? const Color.fromARGB(255, 241, 230,130):const Color.fromARGB(255, 226, 189, 255);
                    }),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  child: Text(
                    currentIndex == contents.length - 1 ? 'Sign In' : 'Next',
                    style: currentIndex == contents.length - 1
                        ? const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 170, 140, 36),
                          )
                        : const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 139, 93, 175), // Or any other color you want for 'Next'
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
