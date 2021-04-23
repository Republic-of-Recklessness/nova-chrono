import 'package:flutter/material.dart';
import 'package:nova_chrono/components/chrono_list_view.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/providers/auth_provider.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    ChronoListProvider chronoListProvider = context.watch<ChronoListProvider>();
    return Scaffold(
      backgroundColor: back_grey,
      extendBodyBehindAppBar: true,
      appBar: appBar,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: pink.withOpacity(0.85),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.only(left: 15.0),
            children: <Widget>[
              SizedBox(
                height: 40.0,
                width: double.infinity,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 0, 0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30.0,
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Updates',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  context.read<AuthProvider>().signOut();
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Svg('images/HomeBg.svg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: appBar.preferredSize.height + 40,
                width: double.infinity,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Nova ',
                    style: TextStyle(
                      fontFamily: 'Modulus',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'Chrono',
                        style: TextStyle(
                          color: pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
                width: double.infinity,
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Lists',
                  style: TextStyle(
                    fontSize: 36,
                    color: pink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
                width: double.infinity,
              ),
              ChronoListView(),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    onPrimary: pink,
                    primary: pink,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
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
                                chronoListProvider.loadValues(chronoList);
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
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Add List',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
