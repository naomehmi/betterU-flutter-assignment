import 'package:better_u/models/custom_widgets/login_texfield.dart';
import 'package:better_u/state_management/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<dynamic> LoginModal(context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext _) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    LoginTextfield(controller: emailController, icon: Icons.email_rounded, keyboard: TextInputType.emailAddress, hint: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextfield(controller: passwordController, icon: Icons.password, keyboard: TextInputType.name, hint: "Password"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          height: 60,
                          margin: const EdgeInsets.only(
                              left: 60, right: 60, top: 10),
                          width: double.infinity,
                          child: Consumer<UserManagement>(
                              builder: (context, user, child) {
                            return ElevatedButton(
                              onPressed: () {
                                if (user.userLoginCreds(emailController.text,
                                    passwordController.text)) {
                                  user.setCurrentUser(emailController.text);
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      '/home', ModalRoute.withName('/home'));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Incorrect email or password. Please try again."),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(30),
                                    duration: Duration(seconds: 1),
                                  ));
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 226, 189, 255)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0)),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 139, 93, 175)),
                              ),
                            );
                          })),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
