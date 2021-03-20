import 'package:covid19/features/presentation/utils/contants.dart';
import 'package:covid19/features/presentation/utils/style.dart';
import 'package:flutter/material.dart';

Widget buildAppBar(String text, IconButton iconButton) {
  return AppBar(
    backgroundColor: cPrimaryColor.withOpacity(.03),
    elevation: 0,
    centerTitle: true,
    leadingWidth: 0,
    leading: iconButton,
    title: Center(
      child: Text(
        text,
        style: homeTitleStyle,
      ),
    ),
  );
}
