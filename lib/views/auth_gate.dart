import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/views/Login.dart';
import 'package:untitled1/views/home.dart';

class auth_gate extends StatefulWidget {
  const auth_gate({super.key});

  @override
  State<auth_gate> createState() => _auth_gateState();
}

class _auth_gateState extends State<auth_gate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return home();
            }
            else{
              return Login();
            }
          }),
    );
  }
}
