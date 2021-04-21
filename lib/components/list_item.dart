import 'package:flutter/material.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  ListItem({@required this.listItemName});

  final String listItemName;

  @override
  Widget build(BuildContext context) {
    final chronoListItems =
        context.watch<ChronoListProvider>().getListItems[listItemName];

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
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chronoListItems.length,
              itemBuilder: (BuildContext context, int index) {
                String listSubItem = chronoListItems.keys.toList()[index];
                listSubItem += ' - ';
                listSubItem += chronoListItems.values.toList()[index];
                return Text(
                  listSubItem,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
