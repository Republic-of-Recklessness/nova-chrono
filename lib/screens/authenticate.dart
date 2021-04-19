import 'package:flutter/material.dart';
import 'package:nova_chrono/screens/home_page.dart';
import 'package:nova_chrono/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return HomePage();
    }
    return LoginPage();
  }
}
