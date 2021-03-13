import 'package:covid19/features/data/models/provinsi_model.dart';
import 'package:covid19/features/presentation/utils/contants.dart';
import 'package:covid19/features/presentation/view_model/main_view_model.dart';
import 'package:covid19/features/presentation/widget/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainViewModel>().getDataProvinsiIndonesia();
  }

  @override
  Widget build(BuildContext context) {
    var province = context.read<MainViewModel>().getDataProvinsiIndonesia();
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: province,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Attributes> data = snapshot.data;
                return Column(
                  children: data.map((e) => InfoCard(
                    
                    title: "Total Recovered",
                    iconColor: Color(0xFF50E3C2),
                    effectedNum: context.watch<MainViewModel>().getSembuh,
                    press: () {},
                  ),).toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
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

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: cBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: cPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
