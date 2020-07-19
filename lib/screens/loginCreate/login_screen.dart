import 'package:cafe_app/screens/forgot_password_screen.dart';
import 'package:cafe_app/screens/loginCreate/create_account_screen1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  String email;
  String password;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: new GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue[700],
                Colors.blue[300],
                Colors.blue[100],
              ],
            ),
          ),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(
                          0,
                          //MediaQuery.of(context).size.width,
                          -1,
                        ),
                        end: Offset.zero,
                      ).animate(
                        _animationController,
                      ),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                child: FadeTransition(
                  opacity: _animationController,
                  child: Image.asset(
                    'assets/images/edited_boba.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(
                        0,
                        .25,
                      ),
                      end: Offset.zero,
                    ).animate(
                      _animationController,
                    ),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              //padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(50, 150, 255, .5),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.blue[100],
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      onFieldSubmitted: (_) =>
                                          FocusScope.of(context).nextFocus(),
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone Number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(
                                          () => email = value.trim(),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        obscureText: true,
                                        onChanged: (value) {
                                          setState(
                                            () => password = value,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(height: 25),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Forgot your password?",
                                    style: TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword(),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            ButtonTheme(
                              minWidth: 200,
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    40,
                                  ),
                                ),
                                color: Colors.lightBlue,
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  dynamic result =
                                      await _auth.signInExistingUser(
                                    email,
                                    password,
                                  );
                                  if (result == null) {
                                    setState(
                                        () => error = "Invalid user info.");
                                  } else {
                                    Navigator.pushReplacementNamed(
                                        context, HomeScreen.id);
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 25.0,
                                bottom: 25.0,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Divider(
                                color: Colors.grey[800],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Sign up here.",
                                    style: TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => (Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateAccount(),
                                            ),
                                          )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
