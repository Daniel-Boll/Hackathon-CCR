import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_ccr/models/facility.dart';
import 'package:hackathon_ccr/models/info.dart';
import 'package:hackathon_ccr/screens/home/reviewCard.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  List<String> list = new List<String>();

  Future getTextWidgets() async{
    QuerySnapshot querySnapshot = await Firestore.instance.collection("facility").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
        list.add( a.documentID);
    }
    for(String a in list){
      //print('Before: '+a);
    } 
  }

  @override
  Widget build(BuildContext context) {
    getTextWidgets();      
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ReviewCard(uid: list)
        ],
      ),
    );
    // return Container(
    //   child: Padding(
    //     padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
    //     child: Column(
    //       children: <Widget>[
    //         ReviewCard(
    //           placeName: 'Posto do seu zé',
    //           currentRating: 4.5,
    //           imageURL: 'https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg',
    //         ),
    //       ],
    //     ),        
    //   ),
    // );
  }
}