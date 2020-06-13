import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/screens/login/login.dart';
import 'package:hackathon_ccr/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    // Return either home or Authenticate widget
    return (user == null) ? Login() : Home();
  }
}