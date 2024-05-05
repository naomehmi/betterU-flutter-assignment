import 'package:flutter/material.dart';

class LoginAndSignUpButton extends StatelessWidget {
  LoginAndSignUpButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color1,
    required this.color2
  });

  Function onPressed;
  String text;
  Color color1;
  Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(
        horizontal:  40,
        vertical: 10
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            color1
          ),
          elevation: MaterialStateProperty.all<double>(0),
        ), // Navigate to home page on button press
        child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color2
          )
        ),
      )
    );
  }
}
