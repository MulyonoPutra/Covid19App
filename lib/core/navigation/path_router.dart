import 'package:flutter/material.dart';

class PathRouter {
  static const home = "/";
  static const hospitalReference = "/hospitalReference";
  static const totalDeath = "/totalDeath";
  static const totalRecover = "/totalRecover";
  static const confirmedCases = "/confirmedCases";
  static const globalData = "/globalData";
  static const vaccineData = "/vaccineData";

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
}
