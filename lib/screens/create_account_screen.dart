import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../screens/login_screen.dart';
import '../services/text_validator.dart';

class CreateAccount extends StatefulWidget {
  static const String id = "create_account_screen";
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _auth = AuthService();
  //final formKey = GlobalKey<FormState>();

  String email;
  String password;
  String username;
  String errorEmail = "";
  String errorUsername = "";
  String errorPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, LoginScreen.id),
          ),
          title: Text("Create an account"),
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
                    decoration:
                        InputDecoration(labelText: "Email", hintText: "Email"),
                    onChanged: (val) {
                      setState(() => email = val.trim());
                    }),
                Text(errorEmail, style: TextStyle(color: Colors.red)),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Username"),
                    onChanged: (val) {
                      setState(() => username = val);
                    }),
                SizedBox(height: 20.0),
                Text(errorUsername, style: TextStyle(color: Colors.red)),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Password"),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);

                      ///THIS PASSWORD VALIDATOR DOES NOT WORK YET
                      var passValidateString = TextValidator(input: password);
                      if (!passValidateString.isPasswordValid()) {
                        setState(() => errorPassword =
                            "Your password does not meet the requirements.");
                      } else {
                        setState(() => errorPassword = "");
                      }
                    }),
                Text(errorPassword, style: TextStyle(color: Colors.red)),
                SizedBox(height: 20.0),
                ButtonTheme(
                  minWidth: 250.0,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child:
                        Text("Sign up", style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      dynamic result =
                          await _auth.createNewUser(email, username, password);
                      if (result == null) {
                        setState(() => errorEmail =
                            // THIS IS NOT WORKING YET
                            "An account under this email already exists.");
                      } else {
                        await showDialog(
                            context: context,
                            child: CupertinoAlertDialog(
                              title: Text("Success!"),
                              content: Text("Welcome to the app " +
                                  username +
                                  ", your account has been successfully created."),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: (() =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog')),
                                  child: Text("OK"),
                                )
                              ],
                            ));
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      }
                    },
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
