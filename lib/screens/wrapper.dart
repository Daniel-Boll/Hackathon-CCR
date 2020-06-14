import 'package:hackathon_ccr/models/facility.dart';
import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/screens/login/authenticate.dart';
import 'package:hackathon_ccr/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = (Provider.of<User>(context));
    final facilities = (Provider.of<Facility>(context));

    // Return either home or Authenticate widget
    // return (user == null) ? Home() : Login();
    return (user == null) ?  Authenticate() : Home();

  }
}