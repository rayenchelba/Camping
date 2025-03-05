import 'package:flutter/material.dart';
import 'package:untitled1/classes/Auth.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final auth=Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         IconButton.outlined(onPressed: (){auth.signout();},
             icon: Icon(Icons.logout))
       ],
     ),
    );
  }
}
