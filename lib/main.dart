import 'package:flutter/material.dart';
import 'package:hackathon_ccr/models/facility.dart';
import 'package:provider/provider.dart';

import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/screens/wrapper.dart';
import 'package:hackathon_ccr/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user
        ),
        StreamProvider<Facility>.value(
          value: AuthService().facility,
        ),
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}