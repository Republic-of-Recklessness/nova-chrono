import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_chrono/utilities/sign_in.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

// Future<bool> listsColExists() {
//   users.doc(userID).get().then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       print('Document exists on the database');
//       return Future<bool>.value(true);
//     } else {
//       return Future<bool>.value(false);
//     }
//   });
// }

Future<void> addList(String listName) async {
  print(userID);
  return users
      .doc(userID)
      .collection('lists')
      .doc(listName)
      .set({'isEmpty': true})
      .then((value) => print('Empty list $listName created.'))
      .catchError((error) => print('Failed to add list $listName.'));
}
