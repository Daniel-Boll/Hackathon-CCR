import 'package:flutter/material.dart';
import 'package:hackathon_ccr/screens/login/loginForm.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fundo_login.png"),
              fit: BoxFit.cover
            )
          ),
        ),
        LoginForm()
      ],
    );
  }
}

