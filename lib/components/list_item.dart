import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({@required this.listItemName, listItems});

  final String listItemName;
  final List listItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(15.0),
      width: 400.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listItemName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
          Container(
            child: ListView.builder(itemCount: listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(listItems[index]);
            },
          ),
        ],
      ),
    );
  }
}
