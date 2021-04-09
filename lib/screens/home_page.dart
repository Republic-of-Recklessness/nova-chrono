import 'package:flutter/material.dart';
import 'package:nova_chrono/components/list_card.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chronoLists = Provider.of<List<ChronoList>>(context);
    final chronoListProvider = Provider.of<ChronoListProvider>(context);

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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chronoLists.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ListCard(
                    colour: Colors.red,
                    listName: chronoLists[index].listName,
                    listIndex: index,
                  );
                },
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
                            ChronoList chronoList = ChronoList(
                                listName: newListTitle,
                                isEmpty: true,
                                listItems: {});
                            print(chronoLists);
                            chronoListProvider.saveData();
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.add),
                          label: Text('Add List'),
                        ),
                      ],
                    ),
                  ),
                );
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
