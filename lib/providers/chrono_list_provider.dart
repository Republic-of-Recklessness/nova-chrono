import 'package:flutter/foundation.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/services/firestore_service.dart';

class ChronoListProvider with ChangeNotifier {
  final service = FirestoreService();
  String _listName;
  bool _isEmpty;
  Map<String, Map<String, dynamic>> _listItems;

  // getters
  String get getListName => _listName;
  bool get getIsEmpty => _isEmpty;
  Map<String, Map<String, dynamic>> get getListItems => _listItems;

  // setters
  void changeListName(String newListName) {
    _listName = newListName;
    notifyListeners();
  }

  void switchEmpty() {
    _isEmpty = !_isEmpty;
    notifyListeners();
  }

  void addListItem(String listName, Map<String, dynamic> listSubItems) {
    _listItems[listName] = listSubItems;
    notifyListeners();
  }

  void updateListItem(
      String oldname, String newListName, Map<String, dynamic> listSubItems) {
    _listItems[newListName] = _listItems[oldname];
    _listItems.remove(oldname);
    notifyListeners();
  }

  loadValues(ChronoList chronoList) {
    _listName = chronoList.listName;
    _isEmpty = chronoList.isEmpty;
    _listItems = chronoList.listItems;
  }
}
