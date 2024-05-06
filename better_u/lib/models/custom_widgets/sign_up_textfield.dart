import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpTextField extends StatefulWidget {
  SignUpTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.errorText,
    required this.hint,
    required this.validate
  });

  String text;
  TextEditingController controller;
  String errorText;
  String hint;
  Function validate;

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple[200],
            fontSize: 20
          ),
        ),
        Consumer<UserManagement>(
          builder: (context, users, child) => TextField(
            autofocus: widget.text == "Name" ? true : false,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 14
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 139, 93, 175),width: 1
                ),
                borderRadius: BorderRadius.all(Radius.zero)
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 139, 93, 175),width: 1
                ),
                borderRadius: BorderRadius.all(Radius.zero)
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 139, 93, 175),
                  width: 2
                ),
                borderRadius: BorderRadius.all(Radius.zero)
              ),
              errorText: widget.errorText
            ),
            controller: widget.controller,
            onChanged: (text){
              setState(() {
                if(widget.text == "Email"){
                String emailValidation = users.isDuplicateEmail(text);
                widget.errorText = widget.errorText.isEmpty ? widget.validate(text, widget.errorText) : emailValidation;
                  setState(() {
                    widget.errorText = widget.errorText.isNotEmpty ? widget.validate(text, widget.errorText) : emailValidation;
                  });
                } else{
                  widget.errorText = widget.validate(text, widget.errorText);
                }
              });
            },
            obscureText: widget.text == "Password" ? true : false,
          ),
        ),
        // const SizedBox(
        //   height: 15,
        // )
      ],
    );
  }
}