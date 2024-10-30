import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  AuthService._();
  static AuthService? _instance;

  static AuthService? get instance{
    if (_instance == null){
      _instance = AuthService._();
    }
  }
  FirebaseAuth? _auth = FirebaseAuth.instance;


}