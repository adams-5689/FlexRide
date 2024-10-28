import 'package:firebase_core/firebase_core.dart';
import 'package:flexride/firebase_options.dart';
import 'package:flexride/pages/home/home.dart';
import 'package:flutter/material.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const Home());
}

