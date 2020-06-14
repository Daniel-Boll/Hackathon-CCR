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

  final String uid;

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {

  String _generalDesc;

  @override
  Widget build(BuildContext context) {
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
              'Estabelecimento (1)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            Divider(height: 30,color: Colors.white),
            SmoothStarRating(
              rating: 3,
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
                // print("rating value -> $value");
                // print("rating value dd -> ${value.truncate()}");
              },
            ),
            SizedBox(height: 30),
            TextField(
              decoration: textInputDecoration.copyWith(hintText: 'Descreva sua experiência.'),
              onChanged: (val) => setState(() => _generalDesc = val),
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
}

/*class ReviewCard extends StatefulWidget {

  final FacilityInfo facility;

  ReviewCard({ this.facility });

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[400],
          ),
          title: Text(facility.name),
          subtitle: Text('Takes 0 sugar(s)'),
        ),
      ),
    );*/

    // return ListView.builder(
    //   itemCount: facilities.length,
    //   itemBuilder: (context,index){
    //     return CardReview(facility: facilities[index]);
    //   }
    // );



    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       Center(
    //           child: CircleAvatar(
    //             backgroundImage: NetworkImage(widget.imageURL ?? ''),
    //             radius: 80,
    //           ),
    //         ),
    //         SizedBox(height: 5),
    //         Text(
    //           '${widget.placeName ?? 'Estabelecimento'} (${widget.currentRating ?? 1})',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 26,
    //           ),
    //         ),
    //         Divider(height: 30,color: Colors.white),
    //         SmoothStarRating(
    //           rating: _rating,
    //           isReadOnly: false,
    //           size: 40,
    //           filledIconData: Icons.star,
    //           halfFilledIconData: Icons.star_half,
    //           defaultIconData: Icons.star_border,
    //           starCount: 5,
    //           allowHalfRating: true,
    //           spacing: 2.0,
    //           color: Colors.yellow,
    //           borderColor: Colors.yellow,
    //           onRated: (value) {
    //             // print("rating value -> $value");
    //             // print("rating value dd -> ${value.truncate()}");
    //           },
    //         ),
    //         SizedBox(height: 30),
    //         TextField(
    //           decoration: textInputDecoration.copyWith(hintText: 'Descreva sua experiência.'),
    //           onChanged: (val) => setState(() => _generalDesc = val),
    //         ),
    //         SizedBox(height: 15),
    //         Container(
    //           height: 200,
    //           child: PageView(
    //             controller: PageController(viewportFraction: .8),
    //             scrollDirection: Axis.horizontal,
    //             pageSnapping: true,
    //             children: <Widget>[
    //               Card(
    //                 margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
    //                 child: ListTile(
    //                   leading: CircleAvatar(
    //                     radius: 25,
    //                     backgroundColor: Colors.green[700],
    //                   ),
    //                   title: Text("Blá blá blá"),
    //                   subtitle: Text('blá blá blá'),
    //                 ),
    //               ),
    //               Card(
    //                 margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
    //                 child: ListTile(
    //                   leading: CircleAvatar(
    //                     radius: 25,
    //                     backgroundColor: Colors.green[700],
    //                   ),
    //                   title: Text("Blá blá blá"),
    //                   subtitle: Text('blá blá blá'),
    //                 ),
    //               ),
    //               Card(
    //                 margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
    //                 child: ListTile(
    //                   leading: CircleAvatar(
    //                     radius: 25,
    //                     backgroundColor: Colors.green[700],
    //                   ),
    //                   title: Text("Blá blá blá"),
    //                   subtitle: Text('blá blá blá'),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //     ],
    //   ),
    // );
//   }
// }