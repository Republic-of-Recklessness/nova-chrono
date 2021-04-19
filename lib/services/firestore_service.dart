import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String uid;

  Future<void> setList(ChronoList chronoList) {
    return users
        .doc(uid)
        .collection('lists')
        .doc(chronoList.listName)
        .set(chronoList.listItems)
        .then((value) => print('New List ${chronoList.listName} added'))
        .catchError(
            (error) => print('Failed to add List ${chronoList.listName}'));
  }

  Stream<List<ChronoList>> getLists() {
    print('inide getLists');
    print(uid);
    return users.doc(uid).collection('lists').snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => ChronoList.fromFirestore(document))
            .toList());
  }

  void setUID(String newuid) {
    uid = newuid;
  }

  Stream<List<ChronoList>> getLists2(Stream<User> userStream) {
    return userStream.switchMap((user) {
      if (user == null) return Stream<List<ChronoList>>.value(null);
      setUID(user.uid);
      return users.doc(uid).collection('lists').snapshots().map((snapshot) =>
          snapshot.docs
              .map((document) => ChronoList.fromFirestore(document))
              .toList());
    });
  }

  Future<void> removeList(String listName) {
    return users
        .doc(uid)
        .collection('lists')
        .doc(listName)
        .delete()
        .then((value) => print('List $listName deleted'))
        .catchError((error) => print('Failed to delete list $listName'));
  }
}
