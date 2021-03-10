import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'features/presentation/screen/home_screen.dart';
import 'features/presentation/utils/contants.dart';
import 'features/presentation/view_model/main_view_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MainViewModel())],
    child: MyApp(),
  ));
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
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: cTextColor)),
      home: HomeScreen(),
    );
  }
}
