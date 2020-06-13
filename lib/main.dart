import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/screens/wrapper.dart';
import 'package:hackathon_ccr/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(AuthService().user);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}