import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final _auth = FirebaseAuth.instance;
  final usersCollection = FirebaseFirestore.instance.collection('users');
  User loggedInUser;

  Future updateUserData(String fullName) async {
    return await usersCollection.doc(uid).set({
      'name': fullName,
    });
  }

  Future getDoc(id) async {
    var snapshot = await usersCollection.doc(id).get();
    var data = snapshot.data()['name'];
    print(data);
  }

   Future<User> getUserEmail() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
    return loggedInUser;
  }

   Future<String> getCurrentUID() async{
     print(_auth.currentUser.uid);
    return (_auth.currentUser).uid;
  }
}
