import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';
import 'create_account_screen2.dart';
import '../../services/text_validator.dart';
import '../../models/create_user_data.dart';
import 'package:email_validator/email_validator.dart';

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
  String firstName;
  String lastName;
  String phoneNumber;

  String errorEmail = "";
  String errorUsername = "";
  String errorPassword = "";

  bool emailValid = false;
  bool passwordValid = false;

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
          "Create an account",
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
                  labelText: "Email",
                  hintText: "Email",
                ),
                autocorrect: false,
                onChanged: (
                  val,
                ) async {
                  setState(
                    () => email = val.trim(),
                  );
                  var emailValidator = EmailValidator.validate(email);
                  if (emailValidator) {
                    setState(() => errorEmail = "");
                    dynamic validUserList =
                        await _auth.checkValidUsername(email);
                    if (validUserList.isEmpty) {
                      setState(
                        () => {
                          errorEmail = "",
                          emailValid = true,
                        },
                      );
                    } else {
                      setState(
                        () => {
                          errorEmail =
                              "An account under this email already exists.",
                          emailValid = false,
                        },
                      );
                    }
                  } else {
                    setState(
                      () => {
                        errorEmail = "Email format is invalid.",
                        emailValid = false,
                      },
                    );
                  }
                },
              ),
              Text(
                errorEmail,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "at least 6 letters and one capital letter",
                ),
                obscureText: true,
                autocorrect: false,
                onChanged: (
                  val,
                ) {
                  setState(
                    () => password = val,
                  );
                  //THIS PASSWORD VALIDATOR DOES NOT WORK YET
                  var passValidateString = TextValidator(
                    input: password,
                  );
                  if (!passValidateString.isPasswordValid()) {
                    setState(() => {
                          errorPassword =
                              "Your password needs to be at least 6 characters long and contain one capital letter.",
                          passwordValid = false,
                        });
                  } else {
                    setState(() => {
                          errorPassword = "",
                          passwordValid = true,
                        });
                  }
                },
              ),
              Text(
                errorPassword,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonTheme(
                minWidth: 250.0,
                child: RaisedButton(
                  color:
                      emailValid && passwordValid ? Colors.blue : Colors.grey,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => {
                    if (emailValid && passwordValid)
                      {
                        print(email),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountScreen2(
                              userDataModel: CreateUserData(
                                email,
                                password,
                                firstName,
                                lastName,
                                phoneNumber,
                              ),
                            ),
                          ),
                        ),
                      }
                  },
                  /*child:
                        Text("Sign up", style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      dynamic result = await _auth.createNewUser(
                          email, firstName, lastName, password);
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
                                  firstName +
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
                    },*/
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
