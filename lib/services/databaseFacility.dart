import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon_ccr/models/facility.dart';
import 'package:hackathon_ccr/models/info.dart';
import 'package:hackathon_ccr/services/auth.dart';

class DatabaseFacilityService {
  final String uid;

  // Constructor
  DatabaseFacilityService({this.uid});

  // Collection reference 
  final CollectionReference facilityCollection = Firestore.instance.collection('facility');

  // Update the Facility Data
  Future updateFacilityData(
    String lat,
    String lng,
    String name,
    double generalRate,
    Map generalSpecificRate,
    Map reviewData
  ) async {
    return await facilityCollection.document(uid).setData({
      'lat': lat,
      'lng': lng,
      'name': name,
      'generalRate': generalRate,
      'generalSpecificRate': generalSpecificRate,
      'reviewData': reviewData
    });
  }

  // Facility list from snapshot
  List<FacilityInfo> _facilityInfoListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return FacilityInfo(
        lat: doc.data['lat'] ?? '',
        lng: doc.data['lng'] ?? '',
        name: doc.data['name'] ?? '',
        generalRate: doc.data['generalRate'] ?? '',
        generalSpecificRate: doc.data['generalSpecificRate'] ?? '',
        reviewData: doc.data['reviewData'] ?? ''
      );
    }).toList();
  }

  // Facility data from snapshot
  FacilityData _facilityDataFromSnapshot(DocumentSnapshot snapshot){
    return FacilityData(
      uid: uid,
      lat: snapshot.data['lat'],
      lng: snapshot.data['lng'],
      name: snapshot.data['name'],
      generalRate: snapshot.data['generalRate'],
      generalSpecificRate: snapshot.data['generalSpecificRate'],
      reviewData: snapshot.data['reviewData'],
    );
  }

  Stream<List<FacilityInfo>> get info{
    return facilityCollection.snapshots()
      .map(_facilityInfoListFromSnapshot);
  }

  Stream<FacilityData> get facilityData {
    return facilityCollection.document(uid).snapshots()
      .map(_facilityDataFromSnapshot);
  }
    
}