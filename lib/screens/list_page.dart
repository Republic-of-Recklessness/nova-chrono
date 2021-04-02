import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_item.dart';
// import 'package:nova_chrono/utilities/constants.dart';
import 'package:nova_chrono/utilities/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatelessWidget {
  ListPage({@required this.listName});

  final String listName;

  @override
  Widget build(BuildContext context) {
    CollectionReference lists = FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lists');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          listName,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        // child: ListView.builder(
        //   itemCount: listItems.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Center(
        //       child: ListItem(
        //         listItemName: listItems[index],
        //       ),
        //     );
        //   },
        // ),
        child: FutureBuilder<DocumentSnapshot>(
          future: lists.doc(listName).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something is Wrong!');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.get('isEmpty')) {
                return Center(
                    child: Text(
                  'This List is Empty',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ));
              } else {
                Map<String, dynamic> data = snapshot.data.data();
                data.forEach((key, value) {
                  if (key != 'isEmpty') {}
                });
              }
            }
            return Text('Loading');
          },
        ),
      ),
    );
  }
}
