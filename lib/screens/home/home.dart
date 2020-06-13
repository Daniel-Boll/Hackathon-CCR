import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackathon_ccr/models/info.dart';
import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/screens/home/profile.dart';
import 'package:hackathon_ccr/screens/home/review.dart';
import 'package:hackathon_ccr/screens/home/routes.dart';
import 'package:hackathon_ccr/services/auth.dart';
import 'package:hackathon_ccr/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _page = 0;

  // Create page widgets
  final ProfilePage profileWidget = ProfilePage();
  final ReviewPage reviewWidget = ReviewPage();
  final RoutesPage routesWidget = RoutesPage();

  Widget _showPage = new RoutesPage();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return routesWidget;
        break;
      case 1:
        return reviewWidget;
        break;
      case 2:
        return profileWidget;
        break;
      default: 
        return new Container(
          child: new Center(
            child: new Text(
              'No Page found by page chooser',
              textScaleFactor: 2,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    
  //final user = Provider.of<UserInfo>(context) ?? [];

    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            // buttonBackgroundColor: Colors.greenAccent,
            items: <Widget>[
              Icon(Icons.map, size: 30),
              Icon(Icons.rate_review, size: 30),
              Icon(Icons.person, size: 30),
            ],
            onTap: (index) {
              setState(() {
                  _showPage = _pageChooser(index);
                });
            },
          ),
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.blueAccent,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      _showPage
                    ],
                  ),
                ),
            ),
          )
        ),
    );
    }
}