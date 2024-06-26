import 'package:better_u/models/custom_widgets/login_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_u/state_management/user_management.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    UserManagement userManagement = Provider.of<UserManagement>(context, listen: false);
    TextEditingController firstNameController = TextEditingController(text: userManagement.loggedInUser.firstName);
    TextEditingController lastNameController = TextEditingController(text: userManagement.loggedInUser.lastName);
    TextEditingController emailController = TextEditingController(text: userManagement.loggedInUser.email);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 50),
            LoginAndSignUpButton(
              color1: const Color.fromARGB(255, 226, 189, 255),
              color2: const Color.fromARGB(255, 139, 93, 175),
              text: "Save Changes",
              onPressed: () {
                userManagement.updateUser(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                );
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
