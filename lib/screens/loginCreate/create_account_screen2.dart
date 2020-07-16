import 'package:cafe_app/screens/loginCreate/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import 'package:flutter/foundation.dart';
import '../../models/create_user_data.dart';

class CreateAccountScreen2 extends StatefulWidget {
  final CreateUserData userDataModel;

  CreateAccountScreen2({
    Key key,
    @required this.userDataModel,
  }) : super(
          key: key,
        );

  @override
  _CreateAccountScreen2State createState() => _CreateAccountScreen2State();
}

class _CreateAccountScreen2State extends State<CreateAccountScreen2> {
  final AuthService _auth = AuthService();

  String email;
  String password;
  String firstName;
  String lastName;
  String phoneNumber;

  bool firstNameValid = false;
  bool lastNameValid = false;
  bool phoneNumberValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(
            context,
          ),
          //Navigator.pushReplacementNamed(context, LoginScreen.id),
        ),
        title: Text(
          "Almost there!",
        ),
      ),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(
            context,
          ).requestFocus(
            new FocusNode(),
          );
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "First Name",
                  ),
                  onChanged: (
                    val,
                  ) {
                    setState(
                      () => {
                        firstName = val.trim(),
                        firstName != ""
                            ? firstNameValid = true
                            : firstNameValid = false
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Last Name",
                  ),
                  onChanged: (
                    val,
                  ) {
                    setState(
                      () => {
                        lastName = val.trim(),
                        lastName != ""
                            ? lastNameValid = true
                            : lastNameValid = false,
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Phone Number",
                  ),
                  onChanged: (val) {
                    setState(
                      () => {
                        phoneNumber = val.trim(),
                        phoneNumber != ""
                            ? phoneNumberValid = true
                            : phoneNumberValid = false,
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  minWidth: 250.0,
                  child: RaisedButton(
                    color: firstNameValid && lastNameValid && phoneNumberValid
                        ? Colors.blue
                        : Colors.grey,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      email = this.widget.userDataModel.email;
                      password = this.widget.userDataModel.password;
                      dynamic result = await _auth.createNewUser(
                        email,
                        password,
                        firstName,
                        lastName,
                        phoneNumber,
                      );
                      if (result == null) {
                        setState(
                          () => print("user cannot be created"),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          child: CupertinoAlertDialog(
                            title: Text("Success!"),
                            content: Text("Welcome to the app " +
                                firstName +
                                ", your account has been successfully created."),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: (() => {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog'),
                                    }),
                                child: Text(
                                  "OK",
                                ),
                              ),
                            ],
                          ),
                        );
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                          context,
                          LoginScreen.id,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
