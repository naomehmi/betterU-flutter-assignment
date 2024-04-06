import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void onPressed(BuildContext context) {
    // Navigate to the Home page
    Navigator.pushReplacementNamed(context, '/home');
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String nameError = '';

  String emailError = '';

  String passwordError = '';

  String validate(text, errorText) {
    if (text.isEmpty) {
      return "Can't be empty";
    } else if (text.length < 4) {
      return "Too short";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 50.0),
            child: Text(
              'Welcome!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                50.0, 10.0, 50.0, 10.0), // Adjust the padding as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    'Are you new here? Join us and we will be happy to be part of your healthy life journey!'),
                const SizedBox(height: 100),
                Text(
                  'Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[200],
                      fontSize: 20),
                ),
                TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: 'full name',
                        hintStyle:
                            TextStyle(color: Colors.grey[500], fontSize: 14),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 139, 93, 175),
                                width: 1),
                            borderRadius: BorderRadius.all(Radius.zero)),
                        errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 139, 93, 175),
                                width: 1),
                            borderRadius: BorderRadius.all(Radius.zero)),
                        focusedErrorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 139, 93, 175),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.zero)),
                        errorText: nameError),
                    controller: nameController,
                    onChanged: (text) {
                      setState(() {
                        nameError = validate(text, nameError);
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[200],
                      fontSize: 20),
                ),
                TextField(
                    decoration: InputDecoration(
                      hintText: 'email address',
                      hintStyle:
                          TextStyle(color: Colors.grey[500], fontSize: 14),
                      border: const UnderlineInputBorder(),
                      errorText: emailError,
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 139, 93, 175),
                              width: 1),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 139, 93, 175),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                    controller: emailController,
                    onChanged: (text) {
                      setState(() {
                        emailError = validate(text, emailError);
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[200],
                      fontSize: 20),
                ),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'create your password',
                      hintStyle:
                          TextStyle(color: Colors.grey[500], fontSize: 14),
                      border: const UnderlineInputBorder(),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 139, 93, 175),
                              width: 1),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 139, 93, 175),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.zero)),
                      errorText: passwordError,
                    ),
                    controller: passwordController,
                    onChanged: (text) {
                      setState(() {
                        passwordError = validate(text, passwordError);
                      });
                    }),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.all(40),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text.length >= 4 && emailController.text.length >= 4 && passwordController.text.length >= 4) {
                        onPressed(context);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text("Please fill in the correct credentials"),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(30),
                          duration: Duration(seconds: 1),
                        ));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 241, 230, 130)),
                      elevation: MaterialStateProperty.all<double>(0),
                    ), // Navigate to home page on button press
                    child: const Text('Join Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 170, 140, 36))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
