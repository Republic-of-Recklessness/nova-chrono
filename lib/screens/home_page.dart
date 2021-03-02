import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_card.dart';
import 'package:nova_chrono/utilities/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back_grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Nova Chrono',
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Lists',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
            ),
            Container(
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  ListCard(
                    colour: Colors.red,
                    listName: 'FOOD',
                  ),
                  ListCard(
                    colour: Colors.blue,
                    listName: 'MONI',
                  ),
                  ListCard(
                    colour: Colors.purple,
                    listName: 'STUDY',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
