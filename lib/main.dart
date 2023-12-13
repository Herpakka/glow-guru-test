import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glow_guru/src/login.dart';
// import 'package:glow_guru/src/login_test.dart';

// import 'package:test4/src/app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDIsuUiMy-3RkL8ZJ9sz1UYJhSfGBbdUyQ",
          appId: "1:482808123726:android:ac01f3014d7d139996ce1f",
          messagingSenderId: "482808123726 ",
          projectId: "glow-guru"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
