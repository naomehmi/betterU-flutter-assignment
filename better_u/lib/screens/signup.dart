import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  void onPressed(BuildContext context) {
    // Navigate to the Home page
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 50.0),
          child: Text(
            'Welcome!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0), // Adjust the padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Are you new here? Join us and we will be happy to be part of your healthy life journey!'),
            SizedBox(height: 100),
            Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[200], fontSize: 20),),
            TextField(
              decoration: InputDecoration(
                hintText: 'full name',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            Text('Email', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[200], fontSize: 20),),
            TextField(
              decoration: InputDecoration(
                hintText: 'email address',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            Text('Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple[200], fontSize: 20),),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'create your password',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: 
                ElevatedButton(
                  onPressed: () => onPressed(context), // Navigate to home page on button press
                  child: Text('Join Now', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 170, 140, 36))),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 241, 230, 130)),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                ),
            ),
          ],
        ),
      )
    );
  }
}