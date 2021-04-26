import 'package:flutter/material.dart';
import 'package:nova_chrono/utilities/constants.dart';
import 'package:nova_chrono/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Svg('images/LoginBg.svg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: RichText(
                          text: TextSpan(
                            text: 'Nova ',
                            style: TextStyle(
                              fontFamily: 'Modulus',
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 32,
                      width: double.infinity,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Unlock ',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontSize: 20,
                          color: pink,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'your own collection of customizable lists!',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3),
              _signInButton(),
              SizedBox(height: MediaQuery.of(context).size.height / 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          onPrimary: pink,
          primary: pink,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
        icon: Image.asset(
          "images/google_logo.png",
          width: 20.0,
          height: 20.0,
        ),
        onPressed: () {
          context.read<AuthProvider>().signIn();
        },
        label: Text(
          'Sign in with Google',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'WorkSans',
          ),
        ),
      ),
    );
  }
}
