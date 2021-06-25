import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class Database {
  List docs = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;

    try {
      querySnapshot = await firestore.collection('countries').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "name": doc['name'], "code": doc['code']};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }
}
