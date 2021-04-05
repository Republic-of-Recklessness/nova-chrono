import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_card.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_chrono/services/sign_in.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

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
            FutureBuilder<QuerySnapshot>(
              future: users.doc(userID).collection('lists').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something is wrong.');
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  print('connection status is okay!');
                  List<String> listNames = [];
                  snapshot.data.docs.forEach((doc) {
                    listNames.add(doc.id);
                  });
                  print(listNames);
                  return Container(
                    height: 250.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listNames.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return ListCard(
                          colour: Colors.red,
                          listName: listNames[index],
                        );
                      },
                    ),
                  );
                }
                return Text('loading');
              },
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
                                  users
                                      .doc(userID)
                                      .collection('lists')
                                      .doc(newListTitle)
                                      .set({'isEmpty': true})
                                      .then((value) => print(
                                          'Empty list $newListTitle created.'))
                                      .catchError((error) => print(
                                          'Failed to add list $newListTitle.'));
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
