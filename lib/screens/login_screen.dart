import 'package:flutter/material.dart';
import '../services/auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  String email;
  String password;
  String error = "sample text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(onChanged: (val) {
                  setState(() => email = val);
                }),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.white,
                    child: Text("Sign in"),
                    onPressed: () async {
                      dynamic result =
                          await _auth.signInExistingUser(email, password);
                      if (result == null) {
                        setState(() => error = "Invalid user info. Try again.");
                      } else {
                        setState(() => error = "User information is good.");
                      }
                    }),
                SizedBox(height: 20.0),
                Text(
                  error,
                )
              ],
            ))));
  }
}
