import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "../classes/account.dart";
import "package:myapp/global.dart";

/// A class for communication with Firestore, providing methods to add, read, and delete data.
class FirestoreCommunication {
  // FirestoreCommunication(account acc1){

  // }

  /// Adds a map of data to Firestore under the "usersNew" collection.
  ///
  /// The data is stored with a document ID derived from the "mail" field in the passingMap.
  ///
  /// Parameters:
  /// - `passingMap`: A map containing data to be added to Firestore.
  ///
  /// Returns: A [Future] that completes when the data is successfully added.
  Future<void> addToFirestore(account acc1) async {
    Map<String, dynamic> userData = acc1.toMap();
    // Reference to the Firestore instance
    var firestore = FirebaseFirestore.instance;
    // Reference to the user's document
    var userDocRef = firestore.collection("Users").doc(userData["mail"]);
    // Setting the user's data
    await userDocRef.set(userData);
    // Adding a subcollection 'Pets' and setting the pet data
  }

  /// Reads data from Firestore under the "users" collection.
  ///
  /// Retrieves the main document data and, if available, nested data from subcollections.
  ///
  /// Returns: A [Future] that completes with a map containing the retrieved data.
  Future<account> readFromFStore(String mailAdd) async {
    // Initialize an empty map that will hold the retrieved data.
    Map<String, dynamic> userData = {};
    // account acc2 =
    //     account("Gökberk", "ankara", "14.02@gmail.com", "0507 122 23 13");

    // Reference to Firestore instance.
    var firestoreInstance = FirebaseFirestore.instance;

    // Attempt to retrieve the document from the main collection.
    var mainDocSnapshot =
        await firestoreInstance.collection("Users").doc(mailAdd).get();

    // Check if the document exists in the main collection.
    if (mainDocSnapshot.exists) {
      // Cast the main document data to a Map.
      userData = mainDocSnapshot.data() as Map<String, dynamic>;
    }
    print(userData.runtimeType);
    print("a");
    print(userData["userName"]);
    account acc2 = account.fromMap(
        userData); //Assigning userData's content to account instance to use in the program for further
    return acc2;
  }

  /// Deletes data from Firestore under the "users" collection.
  ///
  /// Deletes the document with the ID "Tarçın".
  ///
  /// Returns: A [Future] that completes when the data is successfully deleted.
  Future<void> deleteFromFStore(String mail) async {
    await FirebaseFirestore.instance.collection("Users").doc(mail).delete();
  }

  Future<List<account>> iterateUsers() async {
    //Function going to iterate in Users collection and brings all the data and stores in a list for futrher usage.
    List<account> Users = [];
    Map<String, dynamic> UserData;
    var firestoreInstance = FirebaseFirestore.instance;

    CollectionReference c = firestoreInstance.collection(
        "Users"); //Right now it iterates through account-test collection.
    //Bu account pet ve vacın günceli bende olmadığı için gökberk'in oluşturduğu collectiondakileri iterate ettim o yapı kullanılacağı için.
    //Account pet vac güncel halleri ile Users altına yazılırsa kullanılır. Users collectionını temizledim.

    QuerySnapshot query = await c.get();

    for (var doc in query.docs) {
      // Each 'doc' is a DocumentSnapshot
      UserData = doc.data() as Map<String, dynamic>;
      account accNew = account.fromMap(UserData);
      Users.add(accNew);
      // print(doc.data()); // Or perform any operation with the document
    }
    print("succes");
    return Users;
  }

  String FindOwner(String? BarcodeNumber, List<account> Users) {
    //To find the owner according to given barcode number. Then return user's mail address if it is found. If not it will return NO
    for (var user in Users) {
      for (var pet in user.getPetList()) {
        if (pet.getPetId() == BarcodeNumber) {
          print("Found");
          return (user.getMail());
        }
      }
    }
    return "NO";
  }

  Future<void> addHelpToFirestore(
      String topic, String text, String? mail) async {
    Map<String, dynamic> HelpBox = {"Topic": topic, "Text": text};
    // Reference to the Firestore instance
    var firestore = FirebaseFirestore.instance;
    // Reference to the user's document
    var userDocRef = firestore.collection("HelpDesk").doc(mail);
    // Setting the user's data
    await userDocRef.set(HelpBox);
    // Adding a subcollection 'Pets' and setting the pet data
  }
}
