import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon_ccr/models/facility.dart';

import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Create user object based on model User
  User _userFromFirebaseUser(FirebaseUser user){
    return (user != null) ? User(uid: user.uid) : null;
  }

  Facility _facilityFirebaseUser(FirebaseUser facility){
    return (facility != null) ? Facility(uid: facility.uid) : null;
  }

  // Auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  Stream<Facility> get facility{
    return _auth.onAuthStateChanged
      .map(_facilityFirebaseUser);
  }

  // Sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);   
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password, String name, String phone, String placa, String cpf, String antt) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // Create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
        name,
        phone,
        email,
        password,
        placa,
        cpf,
        antt,
        10
      );
      return _userFromFirebaseUser(user);   
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}