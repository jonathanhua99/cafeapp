import 'package:cafe_app/screens/create_account_screen.dart';
import 'package:flutter/gestures.dart';
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
        body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                  child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(
                        helperText: "Email",
                      ),
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      helperText: "Password",
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  Text(error, style: TextStyle(color: Colors.red)),
                  SizedBox(height: 20.0),
                  ButtonTheme(
                    minWidth: 400.0,
                    height: 40.0,
                    child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Text("Sign in",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          dynamic result =
                              await _auth.signInExistingUser(email, password);
                          if (result == null) {
                            setState(
                                () => error = "Invalid user info. Try again.");
                          } else {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
                          }
                        }),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Forgot your password?",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => print("go to forgot password screen"))
                    ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          ))),
/*                   FlatButton(
                      child: Text("Don't have an account? Sign up here."),
                      onPressed: (() => Navigator.pushReplacementNamed(
                          context, CreateAccount.id))), */
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Sign up here.",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushReplacementNamed(
                                context, CreateAccount.id)),
                    ]),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
/*                  FlatButton(
                      child: Text("Forgot password?",
                          style: TextStyle(color: Colors.blue)),
                      onPressed: (() => print("FORGOT PASSWORD PRESSED"))), */
                ],
              ))),
        ));
  }
}
