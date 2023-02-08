import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:piris1/presentation/app/app.dart';
import 'package:piris1/presentation/app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBiIaiwltIqBeuqGsJmheDNhuF5CCPV3oM',
      authDomain: 'piris-b27bd.firebaseapp.com',
      projectId: 'piris-b27bd',
      storageBucket: 'piris-b27bd.appspot.com',
      messagingSenderId: '74537195359',
      appId: '1:74537195359:web:94a3d2c1c81f901be088ea',
    ),
  );
  initInjector();
  runApp(const App());
}
