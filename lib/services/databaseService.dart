import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final usersCollection = FirebaseFirestore.instance.collection('users');

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
}
