import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String Utilisateur = "personne";
  
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      Utilisateur = "personne";
      setState(() {
        
      });
      print('User is currently signed out!');
    } else {
      Utilisateur = "Quelqu'un${user.email}";
      print('User is signed in!');
    }
  });
  }

  //gestion de la connexion google
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Column(
        
        children: [
          const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
            this.Utilisateur
                    ),
          ),
        
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signInWithGoogle,
        child: const Icon(Icons.connected_tv),
        ),
    );
  }
}