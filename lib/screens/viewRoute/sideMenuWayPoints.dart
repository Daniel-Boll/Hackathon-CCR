
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_ccr/models/facility.dart';
import 'package:hackathon_ccr/models/info.dart';
import 'package:hackathon_ccr/services/databaseFacility.dart';
import 'package:hackathon_ccr/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class NavDrawer extends StatelessWidget {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[///////////////////////////////////////q
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Parada 1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg'),
                      radius: 40,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Posto CCR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SmoothStarRating(
                    rating: 3,
                    isReadOnly: true,
                    size: 20,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    color: Colors.yellow,
                    borderColor: Colors.yellow,
                    onRated: (value) {
                      // print("rating value -> $value");
                      // print("rating value dd -> ${value.truncate()}");
                    },
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 100,
                    child: PageView(
                      controller: PageController(viewportFraction: .8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Center(
                          child: RaisedButton(
                            color: Colors.red[700],
                            child: Text(
                              'Escolher outra',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              print("teste");
                            }
                          )
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Divider(height: 30,color: Colors.grey),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Parada 2',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg'),
                      radius: 40,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Posto Gasolinão',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SmoothStarRating(
                    rating: 1.0,
                    isReadOnly: true,
                    size: 20,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    color: Colors.yellow,
                    borderColor: Colors.yellow,
                    onRated: (value) {
                      // print("rating value -> $value");
                      // print("rating value dd -> ${value.truncate()}");
                    },
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 100,
                    child: PageView(
                      controller: PageController(viewportFraction: .8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Center(
                          child: RaisedButton(
                            color: Colors.red[700],
                            child: Text(
                              'Escolher outra',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              print("teste");
                            }
                          )
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Divider(height: 30,color: Colors.grey),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Parada 3',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg'),
                      radius: 40,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Posto Brasil',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SmoothStarRating(
                    rating: 5,
                    isReadOnly: true,
                    size: 20,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    color: Colors.yellow,
                    borderColor: Colors.yellow,
                    onRated: (value) {
                      // print("rating value -> $value");
                      // print("rating value dd -> ${value.truncate()}");
                    },
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 100,
                    child: PageView(
                      controller: PageController(viewportFraction: .8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Center(
                          child: RaisedButton(
                            color: Colors.red[700],
                            child: Text(
                              'Escolher outra',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              print("teste");
                            }
                          )
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Divider(height: 30,color: Colors.grey),
          
        ],
      ),
    );
  }
}

