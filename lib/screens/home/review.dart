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
  }

  @override
  Widget build(BuildContext context) {
    getTextWidgets();      
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReviewCard(uid: list)
          ],
        ),
      ),
    );
  }
}