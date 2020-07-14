class TextValidator {
  final String input;

  TextValidator({this.input});

  bool isPasswordValid() {
    RegExp regexStringObj = new RegExp(r'(?=.*?[A-Z]).{6,}$');
    return regexStringObj.hasMatch(input);
  }
}
