import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//All database related functionalities here
class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final _auth = FirebaseAuth.instance;
  //Creating an instance firebase firestore and users collection
  final usersCollection = FirebaseFirestore.instance.collection('users');
  User loggedInUser;

  Future updateUserData(String fullName, String newsDescription) async {
    return await usersCollection.doc(uid).set(
      {'name': fullName, 'newsDescription': newsDescription},
    );
  }

  Future<User> getUserEmail() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      // print(loggedInUser.email);
    }
    return loggedInUser;
  }

  String getCurrentUID() {
    // print(_auth.currentUser.uid);
    return (_auth.currentUser).uid;
  }

  Future getDoc(id) async {
    var snapshot = await usersCollection.doc(id).get();
    var data = snapshot.data()['name'];
    return data;
    // print(data);
  }

  Future getAllPost() async {
    await for (var snapshot in usersCollection.snapshots()) {
      for (var post in snapshot.docs) {
        return post.data();
      }
    }
  }
}
