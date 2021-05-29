import 'package:covid19/features/presentation/screen/signup_screen.dart';
import 'package:covid19/features/presentation/utils/contants.dart';
import 'package:covid19/features/presentation/widget/rounded_button.dart';
import 'package:covid19/features/presentation/widget/welcome_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    // This size provide us total height and width of our screen
    return (firebaseUser == null)
        ? Scaffold(
            body: WelcomeBackground(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "WELCOME TO EDU",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SvgPicture.asset(
                      "assets/icons/chat.svg",
                      height: size.height * 0.45,
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedButton(
                      text: "LOGIN",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      text: "SIGN UP",
                      color: kPrimaryLightColor,
                      textColor: Colors.black,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        : HomeScreen();
  }
}
