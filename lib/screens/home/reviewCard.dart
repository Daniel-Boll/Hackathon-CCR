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
  

  @override
  Widget build(BuildContext context) {
  return SafeArea(
      child: new StreamBuilder(
        // TODO: Get the document ID from the List Iterating by index of it instead of static
        stream: facilityCollection.document('8686719').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }

          var facilityData = snapshot.data; 
          var next = facilityData['reviewData'].length - 1;
          
          final banheiro = Center(
              child: Column(
                children: <Widget>[
                  Text("Banheiro"),
                  SmoothStarRating(
                    rating: 0,
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
                    onRated: (val) {
                      facilityData['reviewData'][0]['reviewerSpecificRate']['bathroomRate'] = val;
                    },
                  ),
                ],
              ),
          );     

          final patio = Center(
              child: Column(
                children: <Widget>[
                  Text("Pátio"),
                  SmoothStarRating(
                    rating: 0,
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
                    onRated: (val) {
                      facilityData['reviewData'][0]['reviewerSpecificRate']['courtyardRate'] = val;
                    },
                  ),
                ],
              ),
          );     

          final diesel = Center(
              child: Column(
                children: <Widget>[
                  Text("Diesel"),
                  SmoothStarRating(
                    rating: 0,
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
                    onRated: (val) {
                      facilityData['reviewData'][0]['reviewerSpecificRate']['dieselRate'] = val;
                    },
                  ),
                ],
              ),
          );     

          final seguranca = Center(
              child: Column(
                children: <Widget>[
                  Text("Segurança"),
                  SmoothStarRating(
                    rating: 0,
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
                    onRated: (val) {
                      facilityData['reviewData'][0]['reviewerSpecificRate']['securityRate'] = val;
                    },
                  ),
                ],
              ),
          );     

          final tratamento = Center(
              child: Column(
                children: <Widget>[
                  Text("Hospitalidade"),
                  SmoothStarRating(
                    rating: 0,
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
                    onRated: (val) {
                      facilityData['reviewData'][0]['reviewerSpecificRate']['treatmentRate'] = val;
                    },
                  ),
                ],
              ),
          );     


          return Container(
            child: Column(
              children: <Widget>[
                Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg'),
                      radius: 50,
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
                    rating: 0,
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
                      facilityData['reviewData'][next]['reviewerRate'] = value;
                    },
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: textInputDecoration.copyWith(hintText: 'Descreva sua experiência.'),
                    onChanged: (val) => setState(() => facilityData['reviewData']['reviewerDescription'] = val),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
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
                              backgroundImage: NetworkImage('https://i.pinimg.com/564x/bc/f2/e0/bcf2e09c51f24a9cbf4bce267e4070ee.jpg'),
                            ),
                            title: SmoothStarRating(
                              rating: facilityData['reviewData'][0]['reviewerRate']*1.0,
                              isReadOnly: true,
                              size: 20,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 2.0,
                              color: Colors.blue,
                              borderColor: Colors.blue,
                            ),
                            subtitle: Text(
                                '${facilityData['reviewData'][0]['reviewerDescription']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage('https://i.pinimg.com/564x/6c/97/46/6c9746266259e31ba3b7131caee7164b.jpg'),
                            ),
                            title: SmoothStarRating(
                              rating: facilityData['reviewData'][1]['reviewerRate']*1.0,
                              isReadOnly: true,
                              size: 20,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 2.0,
                              color: Colors.blue,
                              borderColor: Colors.blue,
                            ),
                            subtitle: Text(
                                '${facilityData['reviewData'][1]['reviewerDescription']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
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
                  SizedBox(height: 15),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Analise os Tópicos Específicos",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600]  
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 40,
                            child: PageView(
                              controller: PageController(viewportFraction: .8),
                              scrollDirection: Axis.horizontal,
                              pageSnapping: true,
                              children: <Widget>[
                                banheiro, patio, diesel, seguranca, tratamento                                
                              ]
                            )
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: RaisedButton(
                      color: Colors.red[700],
                      child: Text(
                        'Enviar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async{
                        var allThreeRate = {
                          'bathroomRate': facilityData['reviewData'][next]['reviewerSpecificRate']['bathroomRate'],  
                          'courtyardRate': facilityData['reviewData'][next]['reviewerSpecificRate']['courtyardRate'],
                          'securityRate': facilityData['reviewData'][next]['reviewerSpecificRate']['dieselRate'],
                          'dieselRate': facilityData['reviewData'][next]['reviewerSpecificRate']['securityRate'],
                          'treatmentRate': facilityData['reviewData'][next]['reviewerSpecificRate']['treatmentRate']
                        };

                        var reviewer = [{
                          // TODO: Get all last reviewers and add the new one
                        }];

                        dynamic result = await DatabaseFacilityService(uid: '8686719').updateFacilityData('lat', 'lng', 'name', 3, allThreeRate, reviewer);
                      },
                    ),
                  ),
              ],
            ),
          );
        }
      ),
  );
  }
}