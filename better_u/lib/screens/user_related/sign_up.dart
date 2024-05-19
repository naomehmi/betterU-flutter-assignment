import 'package:better_u/main_app/better_u.dart';
import 'package:better_u/models/custom_widgets/login_signup_button.dart';
import 'package:better_u/models/custom_widgets/sign_up_textfield.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Gender? selectedGender;
  
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String nameError = '';
  String emailError = '';
  String passwordError = '';

  String validateInput(String text, String errorText) {
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
      selectedGender = value;
    });
  }

  bool isGenderSelected() {
    return selectedGender != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Welcome!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "Are you new here? Join us and we will be happy to be part of your healthy life journey!"),
              const SizedBox(
                height: 30,
              ),
              SignUpTextField(
                  text: "Name",
                  controller: nameController,
                  errorText: nameError,
                  hint: "Full Name",
                  validate: validateInput),
              Text(
                'Gender',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[200],
                    fontSize: 20),
              ),
              const SizedBox(
               height: 10,
              ),
              Row(
                children: [
                  Radio<Gender>(
                    value: Gender.male,
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
                    value: Gender.female,
                    groupValue: selectedGender,
                    onChanged: handleGenderChange,
                    visualDensity:
                        const VisualDensity(vertical: -4, horizontal: -3),
                  ),
                  const Text('Female'),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio<Gender>(
                    value: Gender.other,
                    groupValue: selectedGender,
                    onChanged: handleGenderChange,
                    visualDensity:
                        const VisualDensity(vertical: -4, horizontal: -3),
                  ),
                  const Text('Other'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SignUpTextField(
                  text: "Email",
                  controller: emailController,
                  errorText: emailError,
                  hint: "Email Address",
                  validate: validateInput),
              SignUpTextField(
                  text: "Password",
                  controller: passwordController,
                  errorText: passwordError,
                  hint: "Password",
                  validate: validateInput),
              Consumer<UserManagement>(
                builder: (context, users, child) => LoginAndSignUpButton(
                  color1: const Color.fromARGB(255, 241, 230, 130),
                  color2: const Color.fromARGB(255, 170, 140, 36),
                  text: "Join Now",
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        isGenderSelected()) {
                      String fullName = nameController.text.trim();
                      List<String> nameParts = fullName.split(' ');
                      String firstName =
                          nameParts.first.toString(); // This will give you "Anna"
                      String lastName = nameParts.length > 1
                          ? nameParts.sublist(1).join(" ")
                          : "";
                      users.newUser(firstName, lastName, emailController.text, passwordController.text, selectedGender!);
                      users.setCurrentUser(emailController.text);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BetterU()), (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill in the correct credentials"),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(30),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
