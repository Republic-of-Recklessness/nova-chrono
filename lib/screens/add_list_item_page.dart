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
    List<List<String>> listSubItems = [
      ["one", ""],
      ["two", ""]
    ];

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
            SizedBox(
              height: 20.0,
              width: double.infinity,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2, // TODO: change to var
              itemBuilder: (BuildContext context, int index) {
                // return Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     TextField(
                //       style: TextStyle(color: Colors.white),
                //       decoration: inputDecoration,
                //       onChanged: (String newText) {
                //         listSubItems[index][0] = newText;
                //         print(listSubItems);
                //       },
                //     ),
                //     TextField(
                //       style: TextStyle(color: Colors.white),
                //       decoration: inputDecoration,
                //       onChanged: (String newText) {
                //         listSubItems[index][1] = newText;
                //         print(listSubItems);
                //       },
                //     ),
                //   ],
                // );
                return TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: inputDecoration,
                  onChanged: (String newText) {
                    listSubItems[index][0] = newText;
                    print(listSubItems);
                  },
                );
              },
            ),
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
