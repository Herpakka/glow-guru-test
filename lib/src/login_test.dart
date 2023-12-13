import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glow_guru/src/home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  /// The line `MyLoginPage({Key key}) : super(key: key);` is the constructor for the `MyLoginPage`
  /// class. It takes an optional `Key` parameter and passes it to the superclass constructor using the
  /// `super` keyword. The `Key` parameter is used to uniquely identify the widget in the widget tree.
  // MyLoginPage({required Key key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("My Firebase App",
              style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            color: Colors.green[50],
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.lightGreen),
                  margin: const EdgeInsets.all(32),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildTextFieldEmail(),
                      buildTextFieldPassword(),
                      buildButtonSignIn(),
                    ],
                  )),
            )));
  }

  Container buildButtonSignIn() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: () {
            // Handle sign-in button tap
            signIn();
          },
          child: Container(
            constraints: const BoxConstraints.expand(height: 50),
            alignment: Alignment.center,
            child: const Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ));
  }

  Container buildTextFieldEmail() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: "Email"),
        style: TextStyle(fontSize: 18),
        controller: emailController,
      ),
    );
  }

  Container buildTextFieldPassword() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration.collapsed(hintText: "Password"),
        style: TextStyle(fontSize: 18),
        controller: passwordController, // Change semicolon to comma
      ),
    );
  }

  Future<void> checkAuth(BuildContext context) async {
    User? user = _auth.currentUser;

    if (user != null) {
      print("Already signed in with ${user.email}");

      // Create a key for the MyHomePage widget
      Key myHomePageKey = GlobalKey();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(key: myHomePageKey, user: user),
        ),
      );
    }
  }

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Access the authenticated user from UserCredential
      User? user = userCredential.user;

      if (user == null) {
        throw Exception("User information is null after signing in.");
      }

      print("Signed in: ${user.email}");
    } catch (error) {
      print("Error signing in: $error");
    }
  }
}
