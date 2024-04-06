import 'package:better_u/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

Future<dynamic> LoginModal(context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Column(
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
                              borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 139, 93, 175)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 139, 93, 175)),
                              borderRadius: BorderRadius.circular(10)
                            ),
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(150, 139, 93, 175)
                        ),
                        labelText: "Email",
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 139, 93, 175)
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.email_rounded), color: const Color.fromARGB(255, 139, 93, 175)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
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
                              borderSide: const BorderSide(width: 1, color: Color.fromARGB(255, 139, 93, 175)),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Color.fromARGB(255, 139, 93, 175)),
                              borderRadius: BorderRadius.circular(10)
                            ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(150, 139, 93, 175)
                        ),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 139, 93, 175)
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.lock), color: const Color.fromARGB(255, 139, 93, 175),),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                          left: 60, right: 60, top: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
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
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
