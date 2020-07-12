import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _retUserFromFireBase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //User _firebaseUser (FirebaseUser user) {
  //return user != null ? User()
  //}
  //sign in with email password
  Future signInExistingUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _retUserFromFireBase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //register with email and password

  //sign out method
}
