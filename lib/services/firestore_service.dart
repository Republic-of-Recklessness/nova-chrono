import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_chrono/services/sign_in.dart';
import 'package:nova_chrono/models/chrono_list.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> setList(ChronoList chronoList) {
    return users
        .doc(userID)
        .collection('lists')
        .doc(chronoList.listName)
        .set(chronoList.listItems)
        .then((value) => print('New List ${chronoList.listName} added'))
        .catchError(
            (error) => print('Failed to add List ${chronoList.listName}'));
  }

  Stream<List<ChronoList>> getLists() {
    return users.doc(userID).collection('lists').snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => ChronoList.fromFirestore(document))
            .toList());
  }

  Future<void> removeList(String listName) {
    return users
        .doc(userID)
        .collection('lists')
        .doc(listName)
        .delete()
        .then((value) => print('List $listName deleted'))
        .catchError((error) => print('Failed to delete list $listName'));
  }
}
