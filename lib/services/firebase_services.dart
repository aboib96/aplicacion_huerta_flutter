import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List personas = [];

  QuerySnapshot querySnapshot = await db.collection('Personas').get();

  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": doc.id,
    };
    personas.add(person);
  }

  return personas;
}

//Para guardar
Future<void> addPeople(String name) async {
  await db.collection("Personas").add({"name": name});
}

// Para Actualizar
Future<void> updatePeople(String uid, String newName) async {
  await db.collection("Personas").doc(uid).set({"name": newName});
}
