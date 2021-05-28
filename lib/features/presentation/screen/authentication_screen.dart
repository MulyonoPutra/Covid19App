import 'package:covid19/features/data/data_source/firebase_auth_service.dart';
import 'package:flutter/material.dart';

import '../widget/app_bar.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController(text: "");
    TextEditingController passwordController =
        new TextEditingController(text: "");

    return Scaffold(
        appBar: buildAppBar(
          'Login Page',
          IconButton(
            icon:
                new Icon(Icons.arrow_back, size: 30, color: Color(0xFF5856D6)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height:50),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.person),
                    hintText: "Email",
                    errorStyle: TextStyle(height: 0),
                    fillColor: Colors.black,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(color: Colors.red),
                    ),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              SizedBox(height:10),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(Icons.person),
                    hintText: "Password",
                    errorStyle: TextStyle(height: 0),
                    fillColor: Colors.black,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(color: Colors.red),
                    ),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              SizedBox(height:10),
              // ElevatedButton(
              //   onPressed: () async {
              //     await AuthServices.signInAnonymous();
              //   },
              //   style: ElevatedButton.styleFrom(
              //       primary: Color(0xFF5856D6),
              //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //       textStyle:
              //           TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              //   child: Text('Sign In Anonymous'),
              // ),
              ElevatedButton(
                onPressed: () async {
                  await AuthServices.signIn(
                      emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5856D6),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AuthServices.signUp(
                      emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5856D6),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ));
  }
}
