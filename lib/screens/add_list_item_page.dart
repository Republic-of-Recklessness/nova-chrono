import 'package:flutter/material.dart';
import 'package:nova_chrono/utilities/constants.dart';

class AddListItemPage extends StatefulWidget {
  @override
  _AddListItemPageState createState() => _AddListItemPageState();
}

class _AddListItemPageState extends State<AddListItemPage> {
  @override
  Widget build(BuildContext context) {
    String listTitle;
    int numOfListItems = 2;
    Map<String, String> listItemMap;

    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: inputDecoration,
              onChanged: (String newText) {
                listTitle = newText;
              },
            ),
            ListView.builder(
              itemCount: numOfListItems,
              itemBuilder: (BuildContext context, int index) {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          'Add List Item',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
