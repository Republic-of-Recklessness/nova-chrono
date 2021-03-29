import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_card.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:nova_chrono/utilities/firestore_manage.dart';

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
                    listItems: ['Monday', 'Tuesday'],
                  ),
                  ListCard(
                    colour: Colors.blue,
                    listName: 'MONI',
                    listItems: ['haha', 'hah', 'ipsum', 'dolor'],
                  ),
                  ListCard(
                    colour: Colors.purple,
                    listName: 'STUDY',
                    listItems: ['kaa', 'boom', 'lorem'],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            TextButton.icon(
              onPressed: () {
                String newListTitle;
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('New List'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                autofocus: true,
                                textAlign: TextAlign.center,
                                onChanged: (newText) {
                                  newListTitle = newText;
                                },
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  addList(newListTitle);
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.add),
                                label: Text('Add List'),
                              ),
                            ],
                          ),
                        ));
              },
              icon: Icon(Icons.add),
              label: Text(
                'Add List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
