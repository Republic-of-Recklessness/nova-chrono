import 'package:cloud_firestore/cloud_firestore.dart';

class ChronoList {
  String listName;
  bool isEmpty;
  Map<String, Map<String, dynamic>> listItems;

  ChronoList({this.listName, this.isEmpty, this.listItems});

  factory ChronoList.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    bool isEmptyCopy = data['isEmpty'];
    data.remove('isEmpty');
    return ChronoList(
        listName: doc.id, isEmpty: isEmptyCopy ?? true, listItems: data ?? {});
  }
}
