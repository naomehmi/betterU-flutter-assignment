import 'package:better_u/screens/home.dart';
import 'package:better_u/screens/onboarding_model.dart';
import 'package:better_u/screens/signup.dart';
import 'package:flutter/material.dart';


class OnboardingPage extends StatefulWidget {
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
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SignUp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: nextPage,
              child: Text(
                currentIndex == contents.length - 1 ? 'Continue' : 'Next', style: TextStyle(fontSize: 18, 
                fontWeight: FontWeight.bold, color: Color.fromARGB(255, 139, 93, 175)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 226, 189, 255)),
                elevation: MaterialStateProperty.all<double>(0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
