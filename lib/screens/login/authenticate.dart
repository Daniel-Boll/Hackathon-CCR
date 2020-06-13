import 'package:hackathon_ccr/screens/login/createAccount.dart';
import 'package:hackathon_ccr/screens/login/login.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignIn = true;
  
  void toggleView() => setState(() => showSignIn = !showSignIn);
  
  @override
  Widget build(BuildContext context) {
    return (showSignIn) 
      ? Login()
      : CreateAccount();
  }
}