import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_item.dart';
// import 'package:nova_chrono/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
// import 'package:nova_chrono/models/chrono_list.dart';
// import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:nova_chrono/screens/add_list_item_page.dart';

class ListPage extends StatelessWidget {
  ListPage({@required this.listName, this.listIndex});

  final String listName;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    final chronoList = Provider.of<List<ChronoList>>(context)[listIndex];
    final chronoListProvider = Provider.of<ChronoListProvider>(context);
    final List chronoListKeys = chronoList.listItems.keys.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          listName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: chronoList.listItems.length,
          itemBuilder: (BuildContext context, int index) {
            String listItemName = chronoListKeys[index];
            print(listItemName);
            return ListItem(
              listItemName: listItemName,
              listIndex: listIndex,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddListItemPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
