import 'package:flutter/material.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:nova_chrono/utilities/constants.dart';
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
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFF373C47),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listItemName,
            style: TextStyle(
              fontFamily: 'WorkSans',
              color: pink,
              fontSize: 35.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chronoListItems.length,
              itemBuilder: (BuildContext context, int index) {
                bool isSpaces = true;
                String listVal = chronoListItems.values.toList()[index];
                if (listVal.isEmpty)
                  isSpaces = true;
                else {
                  for (int i = 0; i < listVal.length; i++) {
                    if (listVal[i] != ' ') {
                      isSpaces = false;
                      break;
                    }
                  }
                }
                String listSubItem = chronoListItems.keys.toList()[index];
                if (!isSpaces) {
                  listSubItem += ' - ';
                  listSubItem += listVal;
                }
                return Text(
                  listSubItem,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w400,
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
