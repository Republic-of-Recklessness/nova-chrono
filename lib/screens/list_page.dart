import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_item.dart';
// import 'package:nova_chrono/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
// import 'package:nova_chrono/models/chrono_list.dart';
// import 'package:nova_chrono/providers/chrono_list_provider.dart';

class ListPage extends StatelessWidget {
  ListPage({@required this.listName, this.listIndex});

  final String listName;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    final chronoList = Provider.of<List<ChronoList>>(context)[listIndex];
    final chronoListProvider = Provider.of<ChronoListProvider>(context);
    final List chronoListKeys = chronoList.listItems.keys.toList();

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
        child: ListView.builder(
          itemCount: chronoList.listItems.length,
          itemBuilder: (BuildContext context, int index) {
            String listItemName = chronoListKeys[index];
            print(listItemName);
            return ListItem(
              listItemName: listItemName,
              listIndex: listIndex,
            );
          },
        ),
        // child: FutureBuilder<DocumentSnapshot>(
        //   future: lists.doc(listName).get(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       print('Something is wrong!');
        //       return Text('Something is Wrong!');
        //     }
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       if (snapshot.data.get('isEmpty')) {
        //         return Center(
        //             child: Text(
        //           'This List is Empty',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 40.0,
        //             fontWeight: FontWeight.w700,
        //           ),
        //         ));
        //       } else {
        //         List<ListItem> listItemWidgets = [];
        //         print('list $listName not empty!');
        //         Map<String, dynamic> data = snapshot.data.data();
        //         data.forEach((key, value) {
        //           if (key != 'isEmpty') {
        //             Map<String, dynamic> listItemData = value;
        //             List<String> listItems = [];
        //             listItemData.forEach((key1, value1) {
        //               String tempStr = key1;
        //               tempStr += " - ";
        //               tempStr += value1;
        //               listItems.add(tempStr);
        //             });
        //             listItemWidgets.add(ListItem(
        //               listItemName: key,
        //               listItems: listItems,
        //             ));
        //           }
        //         });
        //         return ListView.builder(
        //           itemCount: data.length - 1,
        //           itemBuilder: (BuildContext context, int index) {
        //             return listItemWidgets[index];
        //           },
        //         );
        //       }
        //     }
        //     return Text(
        //       'Loading',
        //       style: TextStyle(color: Colors.white),
        //     );
        //   },
        // ),
      ),
    );
  }
}
