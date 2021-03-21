import 'package:covid19/core/navigation/path_router.dart';
import 'package:covid19/features/presentation/screen/confirmed_case_screen.dart';
import 'package:covid19/features/presentation/screen/home_screen.dart';
import 'package:covid19/features/presentation/screen/hospital_reference.dart';
import 'package:covid19/features/presentation/screen/total_death_screen.dart';
import 'package:covid19/features/presentation/screen/total_recover_screen.dart';
import 'package:flutter/material.dart';

class ScreenRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PathRouter.hospitalReference:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                HospitalReference(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);

      case PathRouter.confirmedCases:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                ConfirmedCaseScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);

      case PathRouter.totalDeath:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                TotalDeathScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);

      case PathRouter.totalRecover:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                TotalRecoverScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);

      default:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
    }
  }
}