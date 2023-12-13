import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glow_guru/src/login.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 93, 9, 230),
          title: Text(
              "${user?.email ?? 'User'}"), // Use user?.email to handle null
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.white,
              onPressed: () {
                signOut(context);
              },
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }

  void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      ModalRoute.withName('/'),
    );
  }
}
