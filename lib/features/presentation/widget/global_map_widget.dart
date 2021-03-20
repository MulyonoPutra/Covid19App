  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget globalMap() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 21),
            blurRadius: 54,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Global Map",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SvgPicture.asset("assets/icons/more.svg")
            ],
          ),
          SizedBox(height: 10),
          SvgPicture.asset("assets/icons/map.svg"),
        ],
      ),
    );
  }