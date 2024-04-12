import 'package:better_u/data/all_users.dart';
import 'package:better_u/data/logged_in_user.dart';
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
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Scaffold(
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 139, 93, 175)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 139, 93, 175)),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(150, 139, 93, 175)),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 139, 93, 175)),
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.email_rounded),
                              color: const Color.fromARGB(255, 139, 93, 175)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        controller: emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 139, 93, 175)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 139, 93, 175)),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(150, 139, 93, 175)),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 139, 93, 175)),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.lock),
                            color: const Color.fromARGB(255, 139, 93, 175),
                          ),
                        ),
                        obscureText: true,
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 60,
                        margin:
                            const EdgeInsets.only(left: 60, right: 60, top: 10),
                        width: double.infinity,
                        child: Consumer<AllUsers>(
                            builder: (context, database, child) {
                          return Consumer<LoggedInUser>(
                            builder: (context, user, child){
                              return ElevatedButton(
                                onPressed: () {
                                  if (database.login(
                                      emailController.text, passwordController.text)) {
                                      Map<String,dynamic> userWhoLoggedIn = database.users.firstWhere((e) => e["email"] == emailController.text);
                                      user.currentUser(userWhoLoggedIn["first name"], userWhoLoggedIn["last name"], userWhoLoggedIn["email"]);
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        '/home', (Route<dynamic> route) => false);
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
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 226, 189, 255)),
                                    elevation: MaterialStateProperty.all<double>(0)),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 139, 93, 175)),
                                ),
                              );
                            }
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
