import 'package:flutter/material.dart';
import 'features/presentation/screen/home_screen.dart';
import 'features/presentation/utils/contants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 App',
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: cBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: cTextColor)
      ),
      home: HomeScreen(),
    );
  }
}