import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../classes/vaccination.dart';

void vaccinationTest() {
  var db = FirebaseFirestore.instance;

  Vaccination vac = Vaccination(
    'flu',
    DateTime(2023, 1, 1),
    'Dan Walker',
  );

  print('Created vaccine record:');
  print('Type: ${vac.getType()}');
  //print('Date: ${vac.getDate()}');
  print('date: ${vac.getDate()}');

  db.collection('vaccinations-test').add(vac.toMap()).then(
      (DocumentReference doc) =>
          print('Document snapshot added with id: ${doc.id}'));
}
