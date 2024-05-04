import 'package:better_u/data/all_users.dart';
import 'package:better_u/data/logged_in_user.dart';
import 'package:better_u/screens/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Gender { Male, Female }

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void onPressed(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => BottomNav()));
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Gender? selectedGender;

  String nameError = '';
  String emailError = '';
  String passwordError = '';
  String emailValidation = '';

  String validate(text, errorText) {
    if (text.isEmpty) {
      return "Can't be empty";
    } else if (text.length < 4) {
      return "Too short";
    } else {
      return "";
    }
  }

  void handleGenderChange(Gender? value) {
    setState(() {
      selectedGender = value ?? selectedGender;
    });
  }

  bool isGenderSelected() {
    return selectedGender != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
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
                const SizedBox(height: 70),
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
                  height: 15,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[200],
                      fontSize: 20),
                ),
                Row(
                  children: [
                    Radio<Gender>(
                      value: Gender.Male,
                      groupValue: selectedGender,
                      onChanged: handleGenderChange,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity:
                          const VisualDensity(vertical: -4, horizontal: -3),
                    ),
                    const Text('Male'),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio<Gender>(
                      value: Gender.Female,
                      groupValue: selectedGender,
                      onChanged: handleGenderChange,
                    ),
                    const Text('Female'),
                  ],
                ),
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
                Consumer<AllUsers>(builder: (context, database, child) {
                  return TextField(
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
                          emailValidation = database.validateEmail(text);
                          emailError = emailValidation.isEmpty
                              ? validate(text, emailError)
                              : emailValidation;
                        });
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
                  child:
                      Consumer<AllUsers>(builder: (context, database, child) {
                    return Consumer<LoggedInUser>(
                        builder: (context, user, child) {
                      return ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              isGenderSelected()) {
                            String fullName = nameController.text.trim();
                            List<String> nameParts = fullName.split(' ');
                            String firstName = nameParts.first
                                .toString(); // This will give you "Anna"
                            String lastName = nameParts.length > 1
                                ? nameParts.sublist(1).join(" ")
                                : "";
                            database.newUser(firstName, lastName,
                                emailController.text, passwordController.text);
                            user.currentUser(
                                firstName, lastName, emailController.text);
                            onPressed(context);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Please fill in the correct credentials"),
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
                      );
                    });
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
