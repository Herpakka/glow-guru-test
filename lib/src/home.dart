import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glow_guru/src/login_test.dart';

class MyHomePage extends StatefulWidget {
  final User user;

  // Make the 'key' parameter required
  MyHomePage({required Key key, required this.user}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Firebase App", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.white,
              onPressed: () {
                signOut(context);
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Hello", style: TextStyle(fontSize: 26)),
              Text(widget.user.email ?? "", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
        ModalRoute.withName('/'));
  }
}
