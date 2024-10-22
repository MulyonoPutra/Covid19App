import 'package:covid19/features/data/data_source/firebase_auth_service.dart';
import 'package:covid19/features/presentation/helper/list_category.dart';
import 'package:covid19/features/presentation/screen/confirmed_case_screen.dart';
import 'package:covid19/features/presentation/screen/total_recover_screen.dart';
import 'package:covid19/features/presentation/widget/app_bar.dart';
import 'package:covid19/features/presentation/widget/category_card.dart';
import 'package:covid19/features/presentation/widget/global_map_widget.dart';
import 'package:covid19/features/presentation/widget/help_card.dart';
import 'package:covid19/features/presentation/widget/prevention_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/contants.dart';
import '../view_model/main_view_model.dart';
import '../widget/chart_widget.dart';
import '../widget/info_card.dart';
import 'total_death_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategorieModel> categories = <CategorieModel>[];

  @override
  void initState() {
    super.initState();
    context.read<MainViewModel>().getAllDataIndonesia();
    context.read<MainViewModel>().getDataProvinsiIndonesia();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        "Covid-19 Indonesia Live Data",
        IconButton(
          icon: new Icon(Icons.arrow_back, size: 30, color: Color(0xFFFFFFFF)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      imageAssetUrl: categories[index].imageAssetUrl,
                      categoryName: categories[index].categorieName,
                      route: categories[index].route,
                    );
                  }),
            ),
            SizedBox(height: 10),
            _buildStatistic(),
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
                InfoCard(
                  title: "Confirmed Cases",
                  iconColor: Color(0xFFFF8C00),
                  effectedNum: context.watch<MainViewModel>().getPositif,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ConfirmedCaseScreen();
                        },
                      ),
                    );
                  },
                ),
                InfoCard(
                  title: "Total Deaths",
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: context.watch<MainViewModel>().getMeninggal,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TotalDeathScreen();
                        },
                      ),
                    );
                  },
                ),
                InfoCard(
                  title: "Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: context.watch<MainViewModel>().getSembuh,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TotalRecoverScreen();
                        },
                      ),
                    );
                  },
                ),
                InfoCard(
                  title: "Total Treated",
                  iconColor: Color(0xFF5856D6),
                  effectedNum: context.watch<MainViewModel>().getDirawat,
                  press: () {},
                ),
              ]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Preventions",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    buildPreventation(),
                    SizedBox(height: 40),
                    buildHelpCard(context)
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            globalMap(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await AuthServices.signOut();
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5856D6),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                child: Text('Sign Out'),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(24),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: DonutPieChart.withSampleData(),
            ),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildStatisticItem(Colors.blueAccent, "Confirmed",
                    context.watch<MainViewModel>().getPositif),
                _buildStatisticItem(Colors.yellowAccent, "Recovered",
                    context.watch<MainViewModel>().getSembuh),
                _buildStatisticItem(Colors.redAccent, "Deaths",
                    context.watch<MainViewModel>().getMeninggal),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(Color color, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }

  Row buildPreventation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PreventitonCard(
          svgSrc: "assets/icons/hand_wash.svg",
          title: "Wash Hands",
        ),
        PreventitonCard(
          svgSrc: "assets/icons/use_mask.svg",
          title: "Use Masks",
        ),
        PreventitonCard(
          svgSrc: "assets/icons/Clean_Disinfect.svg",
          title: "Clean Disinfect",
        ),
      ],
    );
  }
}
