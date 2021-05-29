import 'package:covid19/features/data/data_source/firebase_auth_service.dart';
import 'package:covid19/features/presentation/screen/signup_screen.dart';
import 'package:covid19/features/presentation/widget/already_have_account_check.dart';
import 'package:covid19/features/presentation/widget/login_background.dart';
import 'package:covid19/features/presentation/widget/rounded_button.dart';
import 'package:covid19/features/presentation/widget/rounded_input_field.dart';
import 'package:covid19/features/presentation/widget/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextEditingController emailController = new TextEditingController(text: "");
    TextEditingController passwordController =
        new TextEditingController(text: "");

    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                controller: emailController,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                controller: passwordController,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  await AuthServices.signIn(
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
      ),
    );
  }
}
