import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class Database {
  List docs = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

//Metodo para agregar o crear nueva coleccion
  Future<void> create(String name, String code) async {
    try {
      await firestore.collection("countries").add({
        'name': name,
        'code': code,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

//Metodo para eliminar
  Future<void> delete(String id) async {
    try {
      await firestore.collection("countries").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

//Metodo para leer informacion
  Future<List> read() async {
    QuerySnapshot querySnapshot;

    try {
      querySnapshot =
          await firestore.collection('countries').orderBy('timestamp').get();
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

  Future<void> update(String id, String name, String code) async {
    try {
      await firestore
          .collection("countries")
          .doc(id)
          .update({'name': name, 'code': code});
    } catch (e) {
      print(e);
    }
  }
}
