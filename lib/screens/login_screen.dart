import 'package:cafe_app/screens/create_account_screen.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  String email;
  String password;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text("Please enter your email"),
                TextFormField(onChanged: (val) {
                  setState(() => email = val);
                }),
                SizedBox(height: 20.0),
                Text("Please enter your password"),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.lightBlue,
                    child:
                        Text("Sign in", style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      dynamic result =
                          await _auth.signInExistingUser(email, password);
                      if (result == null) {
                        setState(() => error = "Invalid user info. Try again.");
                      } else {
                        setState(() => error = "User information is valid.");
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      }
                    }),
                Row(
                  children: <Widget>[
                    RaisedButton(
                        child: Text("Forgot password?",
                            style: TextStyle(color: Colors.white)),
                        onPressed: (() => print("FORGOT PASSWORD PRESSED"))),
                    RaisedButton(
                        child: Text("Sign up"),
                        onPressed: (() => Navigator.pushReplacementNamed(
                            context, CreateAccount.id))),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(error)
              ],
            ))));
  }
}
