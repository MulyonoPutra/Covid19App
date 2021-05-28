import 'package:covid19/core/navigation/path_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/navigation/screen_router.dart';
import 'features/data/data_source/firebase_auth_service.dart';
import 'features/presentation/screen/splash_screen.dart';
import 'features/presentation/utils/contants.dart';
import 'features/presentation/view_model/global_data_view_model.dart';
import 'features/presentation/view_model/main_view_model.dart';
import 'features/presentation/view_model/vaccine_data_view_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainViewModel()),
      ChangeNotifierProvider(create: (_) => VaccineDataViewModel()),
      ChangeNotifierProvider(create: (_) => GlobalDataViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 App',
        initialRoute: PathRouter.home,
        onGenerateRoute: ScreenRouter.generateRoute,
        theme: ThemeData(
            primaryColor: cPrimaryColor,
            scaffoldBackgroundColor: cBackgroundColor,
            textTheme:
                Theme.of(context).textTheme.apply(displayColor: cTextColor)),
        home: Splash(),
      ),
    );
  }
}
