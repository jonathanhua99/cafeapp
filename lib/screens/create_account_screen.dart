import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../screens/login_screen.dart';

class CreateAccount extends StatefulWidget {
  static const String id = "create_account_screen";
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _auth = AuthService();

  String email;
  String password;
  String username;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create an account")),
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
              Text("Please enter a username"),
              TextFormField(onChanged: (val) {
                setState(() => username = val);
              }),
              SizedBox(height: 20.0),
              Text("Please enter a password"),
              TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Sign up", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  dynamic result =
                      await _auth.createNewUser(email, username, password);
                  if (result == null) {
                    setState(() => error = "This user already exists.");
                  } else {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  }
                },
              )
            ],
          )),
        ));
  }
}
