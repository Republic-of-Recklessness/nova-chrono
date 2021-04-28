import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_item.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:nova_chrono/screens/add_list_item_page.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ListPage extends StatelessWidget {
  ListPage({@required this.listName, this.listIndex});

  final String listName;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    final chronoListProvider = context.watch<ChronoListProvider>();
    chronoListProvider.loadValues(context.watch<List<ChronoList>>()[listIndex]);
    final List chronoListKeys = chronoListProvider.getListItems.keys.toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Svg('images/HomeBg.svg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: chronoListKeys.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Center(
                child: Text(
                  listName,
                  style: TextStyle(
                    color: pink,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }
            String listItemName = chronoListKeys[index - 1];
            return ListItem(
              listItemName: listItemName,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddListItemPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
