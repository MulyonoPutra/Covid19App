import 'package:covid19/features/presentation/utils/contants.dart';
import 'package:covid19/features/presentation/view_model/vaccine_data_view_model.dart';
import 'package:covid19/features/presentation/widget/app_bar.dart';
import 'package:covid19/features/presentation/widget/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class VaccineTargetScreen extends StatefulWidget {
  @override
  _VaccineTargetScreenState createState() => _VaccineTargetScreenState();
}

class _VaccineTargetScreenState extends State<VaccineTargetScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VaccineDataViewModel>().getAllVaccineData();
  }

  @override
  Widget build(BuildContext context) {
   // var data = context.watch<VaccineDataViewModel>().getProvinsi;

    return Scaffold(
      appBar: buildAppBar(
        "Vaccine Target Data",
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
              child: Wrap(runSpacing: 20, spacing: 20, children: <Widget>[
                DetailCard(
                  title: "Total Target",
                  effectedNum: context.watch<VaccineDataViewModel>().getTotal.toString(),
                  press: () {
                  },
                ),
                DetailCard(
                  title: "Health Human Resources",
                  effectedNum: context.watch<VaccineDataViewModel>().getSumberDayaManusiaKesehatan.toString(),
                  press: () {
                  },
                ),
                DetailCard(
                  title: "Elderly",
                  effectedNum: context.watch<VaccineDataViewModel>().getLansia.toString(),
                  press: () {
                  },
                ),
                DetailCard(
                  title: "Public Officer",
                  effectedNum: context.watch<VaccineDataViewModel>().getPetugasPublik.toString(),
                  press: () {
                  },
                ),
                DetailCard(
                  title: "Vaccination",
                  effectedNum: context.watch<VaccineDataViewModel>().getVaksinasi.toString(),
                  press: () {},
                ),
              ]),
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
