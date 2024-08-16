import 'package:flutter/foundation.dart';
import 'dart:io';
import '../firebase_operations/FirestoreCommunication.dart';
import 'package:firebase_core/firebase_core.dart';
import "../classes/account.dart";
import "../classes/pet.dart";
import '../classes/vaccination.dart';
import '../classes/job.dart';
import '../classes/review.dart';

/// A class representing a test scenario.
class Test {
  /// The main entry point for the test.
  ///
  /// This method initializes a [FirestoreCommunication] instance,
  /// reads data from Firestore, and prints specific values from the retrieved data.
  Future<void> main() async {
    print("çağrıldııı");
    DateTime bDay = DateTime(2020, 04, 03);
    DateTime bDay2 = DateTime(2015, 07, 08);

    DateTime vacDay = DateTime(2023, 11, 11);
    DateTime vacDay2 = DateTime(2023, 12, 12);
    Vaccination vaccination = Vaccination("Kuduz", vacDay, "GTU");
    Vaccination vaccination2 = Vaccination("İç Parazit", vacDay2, "Vet. Ahmet");
    List<Vaccination> va = [vaccination, vaccination2];

    DateTime vacDay3 = DateTime(2024, 01, 01);
    DateTime vacDay4 = DateTime(2024, 01, 01);
    Vaccination vaccination3 = Vaccination("Kuduz", vacDay3, "GTU");
    Vaccination vaccination4 = Vaccination("Lösemi", vacDay4, "GTU");
    List<Vaccination> va2 = [vaccination3, vaccination4];

    account account1 = account(
        "TECHBLUE", "Kocaeli", "testJobList@gmail.com", "0507 122 23 13");

    Review rev1 = Review(account1.getMail(), "revied1.content", 5);
    Review rev2 = Review(account1.getMail(), "revied2.content", 4);

    Job job1 = Job(account1.getMail(), account1.getPhoneNumb(), 1,
        "job1.description", "job1.experience", "JOB 1");
    Job job2 = Job(account1.getMail(), account1.getPhoneNumb(), 2,
        "job2.description", "job2.experience", "JOB 2");
    job1.addReview(rev1);
    job2.addReview(rev2);

    // Initialize Firebase
    await Firebase.initializeApp();

    // Create an instance of FirestoreCommunication
    FirestoreCommunication fsc = FirestoreCommunication();

    Pet newPet = Pet("Kara", bDay, "Dogo", va);
    Pet newPet2 = Pet("Pamuk", bDay2, "Tekir", va2);
    account1.addPetToAcc(newPet);
    account1.addPetToAcc(newPet2);
    account1.addJobToAcc(job1);
    account1.addJobToAcc(job2);
    await fsc.addToFirestore(account1);

    // Read data from Firestore

    account data = await fsc.readFromFStore("testJobList@gmail.com");

    // Print the entire data
    print(data);
    print("\n");
    // Print the value associated with the key "Pets"
    print(data.getCommInfo());
    print("\n");
    // Print the value associated with the key "Tür" under "Pets"
    print(data.getPetCount());
    print("\n");
    // Print the value associated with the key "Vacs" under "Pets"
    data.getPetList()[0].printInfo();
    print("\n");
    // Print the value associated with the key "Name" under "Vacs" under "Pets"
    print(data.getUserName());
    print("\n");

    List<account> UsersData = await fsc.iterateUsers();
     String mailAddress = fsc.FindOwner("Kara",
         UsersData); //Since we do not have barcode number I am passing name and controlling it. Both are strings no problem.
     print(mailAddress);
  }
}
