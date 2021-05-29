import 'package:covid19/features/data/data_source/firebase_auth_service.dart';
import 'package:covid19/features/presentation/screen/signup_screen.dart';
import 'package:covid19/features/presentation/utils/contants.dart';
import 'package:covid19/features/presentation/widget/already_have_account_check.dart';
import 'package:covid19/features/presentation/widget/login_background.dart';
import 'package:covid19/features/presentation/widget/rounded_button.dart';
import 'package:covid19/features/presentation/widget/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/app_bar.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController(text: "");
    TextEditingController passwordController =
        new TextEditingController(text: "");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: LoginBackground(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                TextFieldContainer(
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: "Sign In",
                  press: () async {
                    await AuthServices.signIn(
                        emailController.text, passwordController.text);
                  },
                ),
                RoundedButton(
                  text: "Sign Up",
                  press: () async {
                    await AuthServices.signUp(
                        emailController.text, passwordController.text);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
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
        ));
  }
}
