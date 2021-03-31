import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_chrono/utilities/sign_in.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addList(String listName) async {
  return users
      .doc(userID)
      .collection('lists')
      .doc(listName)
      .set({'isEmpty': true})
      .then((value) => print('Empty list $listName created.'))
      .catchError((error) => print('Failed to add list $listName.'));
}

Future<int> numOfLists() {
  int numOfList = 0;
  users
      .doc(userID)
      .collection('lists')
      .get()
      .then((QuerySnapshot querySnapshot) {
    numOfList = querySnapshot.size;
  });
  return Future.value(numOfList);
}

List<String> getLists() {
  List<String> lists = [];
  users
      .doc(userID)
      .collection('lists')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      lists.add(doc.id);
    });
  });
  return lists;
}
