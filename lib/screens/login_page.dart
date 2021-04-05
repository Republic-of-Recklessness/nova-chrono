import 'package:flutter/material.dart';
import 'package:nova_chrono/screens/home_page.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:nova_chrono/services/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nova Chrono',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 50),
            _signInButton()
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton.icon(
      icon: Image.asset(
        "images/google_logo.png",
        width: 20.0,
        height: 20.0,
      ),
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        });
      },
      style: outlinedButtonStyle,
      label: Text(
        'Sign in with Google',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
