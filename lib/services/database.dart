import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String firstName, String lastName) async {
    return await userCollection.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
