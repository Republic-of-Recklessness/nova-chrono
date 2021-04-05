import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_chrono/services/sign_in.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Stream<List<String>> getLists() {

  // }
}
