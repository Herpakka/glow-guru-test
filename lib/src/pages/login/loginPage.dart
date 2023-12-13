import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _UsernameController = TextEditingController();
  final _PasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _UsernameController.text = "admin";
    _PasswordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(32),
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._buildTextfield(),
                    SizedBox(
                      height: 32,
                    ),
                    ..._buildButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    print("login (${_UsernameController.text}) (${_PasswordController.text})");
  }

  void _handleClickReset() {
    _UsernameController.text = "";
    _PasswordController.text = "";
  }

  _buildButton() {
    return [
      ElevatedButton(onPressed: _handleClickLogin, child: Text("login")),
      OutlinedButton(onPressed: _handleClickReset, child: Text("reset")),
    ];
  }

  _buildTextfield() {
    return [
      TextField(
        controller: _UsernameController,
        decoration: InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _PasswordController,
        decoration: InputDecoration(labelText: "Password"),
      ),
    ];
  }
}
