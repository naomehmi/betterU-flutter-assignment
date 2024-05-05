import 'package:flutter/material.dart';

class LoginTextfield extends StatefulWidget {
  LoginTextfield({
    super.key,
    required this.controller,
    required this.icon,
    required this.keyboard,
    required this.hint,
  });

  TextEditingController controller;
  IconData icon;
  TextInputType keyboard;
  String hint;

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 139, 93, 175)),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: Color.fromARGB(255, 139, 93, 175)),
              borderRadius: BorderRadius.circular(10)),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Color.fromARGB(150, 139, 93, 175)),
          labelText: widget.hint,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 139, 93, 175)),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(widget.icon),
              color: const Color.fromARGB(255, 139, 93, 175)),
        ),
        keyboardType: widget.keyboard,
        autofocus: widget.hint == "Email" ? true : false,
        controller: widget.controller,
        obscureText: widget.hint == "Password" ? true : false,
      ),
    );
  }
}
