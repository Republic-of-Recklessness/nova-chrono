import 'package:flutter/material.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:provider/provider.dart';
import 'package:nova_chrono/components/list_card.dart';

class ChronoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chronoLists = context.watch<List<ChronoList>>();

    return Container(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chronoLists.length,
        itemBuilder: (BuildContext context, int index) {
          return ListCard(
            colour: Colors.red,
            listName: chronoLists[index].listName,
            listIndex: index,
          );
        },
      ),
    );
  }
}
