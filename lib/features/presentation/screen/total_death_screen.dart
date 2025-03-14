import 'package:covid19/features/presentation/utils/contants.dart';
import 'package:covid19/features/presentation/view_model/main_view_model.dart';
import 'package:covid19/features/presentation/widget/app_bar.dart';
import 'package:covid19/features/presentation/widget/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TotalDeathScreen extends StatefulWidget {
  @override
  _TotalDeathScreenState createState() => _TotalDeathScreenState();
}

class _TotalDeathScreenState extends State<TotalDeathScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainViewModel>().getDataProvinsiIndonesia();
  }

  @override
  Widget build(BuildContext context) {
    var data = context.watch<MainViewModel>().getProvinsi;

    return Scaffold(
      appBar: buildAppBar(
        "Total Death",
        IconButton(
          icon: new Icon(Icons.arrow_back, size: 30, color: Color(0xFF5856D6)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: cPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: data.map((e) {
                    return DetailCard(
                      title: e.attributes.provinsi,
                      effectedNum: e.attributes.kasusMeni.toString(),
                      press: () {},
                    );
                  }).toList()),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(
              fontSize: 20,
              color: cPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: cTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "547 ",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: cPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9% ",
          style: TextStyle(color: cPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "New Cases",
          style: TextStyle(
            color: cTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }
}
