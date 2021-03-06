import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({@required this.listItemName});

  final String listItemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: 400.0,
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listItemName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
            ),
          )
        ],
      ),
    );
  }
}
