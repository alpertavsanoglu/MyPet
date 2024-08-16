import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../classes/vaccination.dart';
import '../classes/pet.dart';

void petTest() async {
  var db = FirebaseFirestore.instance;

  /*
  Pet pet = Pet(
    'Rocky',
    DateTime(2020, 5, 4),
    'ownid05',
    [],
  );

  Vaccination vac0 = Vaccination(
    'cold',
    DateTime(2023, 10, 3),
    'cape town',
  );

  Vaccination vac1 = Vaccination(
    'flu',
    DateTime(2024, 1, 1),
    'paris',
  );

  pet.addVaccinationRecord(vac0);
  pet.addVaccinationRecord(vac1);

  Pet pet0 = Pet.fromMap(pet.toMap());

  print(pet0.getPetId());

  db
    .collection('pet-test-v3')
    .add(pet.toMap())
    .then((DocumentReference doc) => print('document snapshot added with id: ${doc.id}'));
  */

  var data = db.collection('pet-test-v3').doc('GkIyF1LR7AHFETdnxbQa').get();

  DocumentSnapshot<Map<String, dynamic>> snapshot = await data;
  Map<String, dynamic> mapData = snapshot.data() ?? {};
  print(mapData);

  Pet pet1 = Pet.fromMap(mapData);

  pet1.printInfo();

  //saved

  print('pet test DONE');
}
