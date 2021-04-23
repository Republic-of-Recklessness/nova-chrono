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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Nova ',
                        style: TextStyle(
                          fontFamily: 'Modulus',
                          fontSize: 55,
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
                    SizedBox(
                      height: 20.0,
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
              SizedBox(height: 50),
              _signInButton()
            ],
          ),
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
        context.read<AuthProvider>().signIn().then((result) {
          // if (result != null) {
          //   Navigator.pop(context);
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //   );
          // }
          print('LoginPage auth success!');
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
