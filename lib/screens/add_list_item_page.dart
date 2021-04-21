import 'package:flutter/material.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:provider/provider.dart';

class AddListItemPage extends StatefulWidget {
  @override
  _AddListItemPageState createState() => _AddListItemPageState();
}

class _AddListItemPageState extends State<AddListItemPage> {
  String listTitle;
  List<List<String>> listSubItems = [
    ["one", ""],
    ["two", ""]
  ];

  void addNewListItem() {
    setState(() {
      listSubItems.add(["${listSubItems.length + 1}", ""]);
    });
    print(listSubItems);
  }

  @override
  Widget build(BuildContext context) {
    ChronoListProvider chronoListProvider = context.watch<ChronoListProvider>();

    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'List Items:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listSubItems.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == listSubItems.length) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        addNewListItem();
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add List Item'),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration,
                            onChanged: (String newText) {
                              listSubItems[index][0] = newText;
                              print(listSubItems);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration,
                            onChanged: (String newText) {
                              listSubItems[index][1] = newText;
                              print(listSubItems);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  chronoListProvider.addListItem(
                      listTitle,
                      Map.fromIterable(listSubItems,
                          key: (e) => e[0], value: (e) => e[1]));
                  chronoListProvider.saveData();
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.add),
                label: Text('Done'),
              ),
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
