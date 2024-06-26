import 'package:better_u/screens/main/about.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:better_u/state_management/theme_provider.dart'; 

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeType;
    Color textColor = theme == ThemeType.dark ? Colors.white : Colors.grey;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Provider.of<ThemeProvider>(context).themeType == ThemeType.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).setTheme(
                  value ? ThemeType.dark : ThemeType.light,
                );
                Provider.of<UserManagement>(context, listen: false).setTheme(
                  value ? ThemeType.dark : ThemeType.light,
                );
              },
            ),
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutSection()),
              );
            },
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: const Text('Version'),
            trailing: Text('v1.0.0', style: TextStyle(fontSize: 14, color: textColor),),
          )
        ],
      ),
    );
  }
}
