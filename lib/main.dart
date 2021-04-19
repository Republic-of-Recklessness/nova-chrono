import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

// providers and models
import 'package:nova_chrono/providers/auth_provider.dart';
import 'package:nova_chrono/models/chrono_list.dart';
import 'package:nova_chrono/providers/chrono_list_provider.dart';

// screens
import 'package:nova_chrono/screens/authenticate.dart';

// services
import 'package:nova_chrono/services/firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChronoListProvider()),
        Provider<AuthProvider>(
          create: (_) => AuthProvider(FirebaseAuth.instance),
        ),
        StreamProvider<User>(
          create: (context) => context.read<AuthProvider>().authState,
          initialData: null,
        ),
        StreamProvider(
          // value: firestoreService
          //     .getLists2(context.read<AuthProvider>().authState),
          create: (context) =>
              context.read<AuthProvider>().authState.switchMap((user) {
            if (user == null) return Stream<List<ChronoList>>.value(null);
            context.read<ChronoListProvider>().setUID(user.uid);
            return users.doc(user.uid).collection('lists').snapshots().map(
                (snapshot) => snapshot.docs
                    .map((document) => ChronoList.fromFirestore(document))
                    .toList());
          }),
          initialData: [
            ChronoList(
              listName: 'Sample List',
              isEmpty: false,
              listItems: {
                'Monday': {
                  'task1': 'lorem',
                  'task2': 'ipsum',
                }
              },
            )
          ],
        ),
      ],
      child: MaterialApp(
        title: 'Nova Chrono',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Modulus',
        ),
        home: Authenticate(),
      ),
    );
  }
}
