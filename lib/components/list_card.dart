import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  ListCard(
      {@required this.colour,
      @required this.listName,
      this.fontColour: Colors.white});

  final Color colour;
  final String listName;
  final Color fontColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 200.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              listName,
              style: TextStyle(
                color: fontColour,
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'View List',
              style: TextStyle(
                color: fontColour,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
