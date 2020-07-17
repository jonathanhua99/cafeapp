import 'package:cafe_app/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/loginCreate/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = "forgot_password_screen";
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthService _auth = AuthService();

  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new GestureDetector(
            onTap: () {
              // FocusScope.of(context).requestFocus(new FocusNode());
              // original implementation creates new FocusNode but never disposes of it, this is cleaner
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
                color: Colors.white,
                child: Form(
                    child: Column(children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.2,
                    // decoration: new BoxDecoration(
                    //   color: Colors.lightBlue,
                    //   shape: BoxShape.circle,
                    // ),
                    // margin: EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/generic_key.png'),
                    color: Colors.lightBlue,
                    constraints: BoxConstraints.tightForFinite(
                      width: double.infinity,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: RichText(
                        text: TextSpan(
                      text: "Forgot your password, did ya?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            "We just need you to enter the email you registered with and we will send" +
                                " you your password reset instructions!",
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    child: TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        onChanged: (val) {
                          setState(() => email = val.trim());
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 40.0), //const EdgeInsets.all(10.0),
                    child: ButtonTheme(
                      minWidth: 300.0,
                      child: RaisedButton(
                          color: Colors.lightBlue,
                          child: Text("Send Request",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            // send email functionality
                            await _auth.sendPasswordResetEmail(email);
                            // await Navigator.pushReplacementNamed(context, LoginScreen.id);
                            await showDialog(
                                context: context,
                                child: CupertinoAlertDialog(
                                  title: Text("Heyooo"),
                                  content: Text(
                                      "An email has been sent to your email!"),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      // isDefaultAction: false,
                                      onPressed: (() => Navigator.of(context,
                                              rootNavigator: true)
                                          .pop('dialog')),
                                      child: Text("Ok"),
                                    )
                                  ],
                                ));
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          }),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "<< Back to PositiveTEA Login Page",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacementNamed(
                                  context, LoginScreen.id)),
                      ]),
                    ),
                  ),
                  Spacer(),
                ])))));
  }
  // simpler version, no picture p much
  //   return Scaffold(
  //       appBar: AppBar(
  //         leading: IconButton(
  //           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
  //           onPressed: () =>
  //               Navigator.pushReplacementNamed(context, LoginScreen.id),
  //         ),
  //         title: Text("Reset Password"),
  //       ),
  //       body: new GestureDetector(
  //           onTap: () {
  //             FocusScope.of(context).requestFocus(new FocusNode());
  //           },
  //           child: Container(
  //               color: Colors.white,
  //               padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
  //               child: Form(
  //                   child: Column(
  //                 children: <Widget>[
  //                   SizedBox(height: 20.0),
  //                   // Padding(
  //                   //   padding: const EdgeInsets.all(1.0),
  //                   //   child: RichText(
  //                   //     text: TextSpan(
  //                   //       text: "Forgot your Password?",
  //                   //       style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(10.0),
  //                     child: TextFormField(
  //                         decoration: InputDecoration(labelText: "Email"),
  //                         onChanged: (val) {
  //                           setState(() => email = val.trim());
  //                         }),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(1.0),
  //                     child: RichText(
  //                       text: TextSpan(
  //                         text:
  //                             "We will send you a link to reset your password",
  //                         style: TextStyle(color: Colors.black, fontSize: 10.0),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 20.0),
  //                   Padding(
  //                     padding: const EdgeInsets.all(10.0),
  //                     child: ButtonTheme(
  //                       minWidth: 250.0,
  //                       child: RaisedButton(
  //                           color: Colors.lightBlue,
  //                           child: Text("Send Request",
  //                               style: TextStyle(color: Colors.white)),
  //                           onPressed: () async {
  //                             // send email functionality
  //                             await _auth.sendPasswordResetEmail(email);
  //                             // await Navigator.pushReplacementNamed(context, LoginScreen.id);
  //                             await showDialog(
  //                                 context: context,
  //                                 child: CupertinoAlertDialog(
  //                                   title: Text("Heyooo"),
  //                                   content: Text(
  //                                       "An email has been sent to your email!"),
  //                                   actions: <Widget>[
  //                                     CupertinoDialogAction(
  //                                       // isDefaultAction: false,
  //                                       onPressed: (() => Navigator.of(context,
  //                                               rootNavigator: true)
  //                                           .pop('dialog')),
  //                                       child: Text("Ok"),
  //                                     )
  //                                   ],
  //                                 ));
  //                             Navigator.pushReplacementNamed(
  //                                 context, LoginScreen.id);
  //                           }),
  //                     ),
  //                   ),
  //                 ],
  //               )))));
  // }
}
