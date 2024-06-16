import 'package:better_u/screens/main/about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:better_u/state_management/theme_provider.dart'; 

class Setting extends StatelessWidget {
  const Setting({Key? key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeType;
    Color textColor = theme == ThemeType.dark ? Colors.white : Colors.grey;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: Provider.of<ThemeProvider>(context).themeType == ThemeType.dark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).setTheme(
                  value ? ThemeType.dark : ThemeType.light,
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutSection()),
              );
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text('Version'),
            trailing: Text('v1.0.0', style: TextStyle(fontSize: 14, color: textColor),),
          )
        ],
      ),
    );
  }
}
