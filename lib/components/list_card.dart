import 'package:flutter/material.dart';
import 'package:nova_chrono/screens/list_page.dart';

class ListCard extends StatelessWidget {
  ListCard({
    @required this.colour,
    @required this.listName,
    this.fontColour: Colors.white,
    this.listIndex,
  });

  final Color colour;
  final String listName;
  final Color fontColour;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 220.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(
                listName: listName,
                listIndex: listIndex,
              ),
            ),
          );
        },
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
      ),
    );
  }
}
