import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/models/info.dart';

class DatabaseService {

  final String uid;

  // Constructor
  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String phone, String email, String password, String placa, String cpf, String antt, int trucoin) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'placa': placa,
      'cpf': cpf, 
      'antt': antt,
      'trucoin': trucoin
    });
  }

  // Brew list from snapshot
  List<UserInfo> _userInfoListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return UserInfo(
        name: doc.data['name'] ?? '',
        antt: doc.data['antt'] ?? '',
        password: doc.data['password'] ?? '',
      );
    }).toList();
  }

  // User Data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      antt: snapshot.data['antt'],
      password: snapshot.data['password']
    );
  }

  // Get brews stream
  // Stream<UserInfo> get infoA{
  //   return userCollection.snapshots()
  //     .map(_userInfoListFromSnapshot);
  // }

  // Get brews stream
  Stream<List<UserInfo>> get info{
    return userCollection.snapshots()
      .map(_userInfoListFromSnapshot);
  }

  // Get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}