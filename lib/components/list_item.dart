import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({@required this.listItemName});

  final String listItemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Text(listItemName),
    );
  }
}
