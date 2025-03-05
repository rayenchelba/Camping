import 'package:flutter/material.dart';
import 'package:untitled1/classes/Auth.dart';
import 'package:untitled1/views/auth_gate.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingsState();
}

class _SettingsState extends State<Setting> {
  final auth=Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
           Center(
             child: IconButton.outlined(
                 onPressed: () async {
                   await auth.signout();
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>auth_gate()));},
                 icon: Icon(Icons.logout)),
           )
         ],
       ),
     ),
    );
  }
}
