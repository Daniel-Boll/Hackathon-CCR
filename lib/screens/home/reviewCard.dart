import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_ccr/models/facility.dart';
import 'package:hackathon_ccr/models/info.dart';
import 'package:hackathon_ccr/services/databaseFacility.dart';
import 'package:hackathon_ccr/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewCard extends StatefulWidget {

  ReviewCard({ Key key, this.uid }): super(key: key);

  final List<String> uid;

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {

  String _generalDesc;
  int index = 0;


  final CollectionReference facilityCollection = Firestore.instance.collection('facility');

  // somethin() async {
  //   var document = await facilityCollection.document('1533224');
  //   document.get() => then((document) {
  //       print(document("name"));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
  return new StreamBuilder(
      stream: facilityCollection.document('1533224').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }

        var facilityData = snapshot.data; 
        print(facilityData['reviewData']['reviewerDescription']);
        return Container(
          child: Column(
            children: <Widget>[
              Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg'),
                    radius: 80,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${facilityData['name']} (${facilityData['generalRate']})',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                Divider(height: 30,color: Colors.white),
                SmoothStarRating(
                  rating: facilityData['generalRate'],
                  isReadOnly: false,
                  size: 40,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 2.0,
                  color: Colors.yellow,
                  borderColor: Colors.yellow,
                  onRated: (value) {
                    facilityData['reviewData']['reviewerRate'] = value;
                  },
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: textInputDecoration.copyWith(hintText: 'Descreva sua experiência.'),
                  onChanged: (val) => setState(() => facilityData['reviewData']['reviewerDescription'] = val),
                ),
                SizedBox(height: 15),
                Container(
                  height: 200,
                  child: PageView(
                    controller: PageController(viewportFraction: .8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green[700],
                          ),
                          title: Column(
                            children: <Widget>[
                              Text(
                                'José' // In the review Data store the UID of the reviewer to be able to get
                              ),
                              SmoothStarRating(
                                    rating: facilityData['reviewData']['reviewerRate']*1.0,
                                    isReadOnly: false,
                                    size: 20,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    starCount: 5,
                                    allowHalfRating: true,
                                    spacing: 2.0,
                                    color: Colors.blue,
                                    borderColor: Colors.blue,
                                    onRated: (value) {
                                      facilityData['reviewData']['reviewerRate'] = value;
                                    }
                              ),
                            ],
                          ),
                          subtitle: Text("Blá blá blá"),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green[700],
                          ),
                          title: Text("Blá blá blá"),
                          subtitle: Text('blá blá blá'),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green[700],
                          ),
                          title: Text("Blá blá blá"),
                          subtitle: Text('blá blá blá'),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      }
    );
  }
}