import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 18),
      bodyPadding: EdgeInsets.all(16)
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: 'Build Your Health',
          body: 'Starting a healthy life? Why Not!',
          image: Image.asset('assets/intro-pic1.png', width: 350),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Transform Your Body',
          body: 'Feel the difference, be your BEST SELF!',
          image: Image.asset('assets/intro-pic2.png', width: 350),
          decoration: pageDecoration
        ),
        PageViewModel(
          title: 'Get Started Now!',
          body: 'Train with us, Reach your GOALS',
          image: Image.asset('assets/intro-pic3.png', width: 350),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
          ) 
        ),
      ],
      onDone: () {

      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      back: Icon(Icons.arrow_back),
      skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.bold)),
      next: Icon(Icons.arrow_forward),
      done: Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(10,10),
        color: Colors.grey,
        activeSize: Size(10,10) 

      ),
    );
  }
}