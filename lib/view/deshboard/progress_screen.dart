import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/line_chart_box.dart';
import 'package:maxedoutstats/widget/progress_dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart' as pchart;
import 'package:sizer/sizer.dart';

class ProgressPageView extends StatefulWidget {
  const ProgressPageView({Key? key}) : super(key: key);

  @override
  State<ProgressPageView> createState() => _ProgressPageViewState();
}

class _ProgressPageViewState extends State<ProgressPageView> {
  Map<String, double> dataMap = {
    "Biceps": 25,
    "Triceps": 12,
    "chest": 14,
    "Back": 16,
    "Shoulders": 23,
    "Other": 18,
  };
  final colorList = <Color>[
    Colors.orange,
    AppColors.lightblue,
    Colors.green,
    Colors.black.withOpacity(0.3),
    Colors.yellow,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 15.h,
          ),
          //ProgressDialog
          pichart(onTapfiltericon: () {
            showDialog(
                context: context,
                builder: (context) {
                  return ProgressDialog();
                });
          }),
          const SizedBox(height: 10.0),
          linegraph(),
          const SizedBox(height: 10.0),
          progressbar(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget progressbar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkbalue,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            listTile(AppStrings.goals, AppStrings.nofWorkouts),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Column(
                children: [
                  LinearPercentIndicator(
                      barRadius: const Radius.circular(20.0),
                      animation: true,
                      lineHeight: 12.0,
                      animationDuration: 2000,
                      percent: 0.5,
                      progressColor: AppColors.primary),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("0", style: TextStyle(color: Colors.grey)),
                        Text("5", style: TextStyle(color: Colors.grey)),
                        Text("10", style: TextStyle(color: Colors.grey)),
                        Text("15", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget listTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          subtitle,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }

  Widget linegraph() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkbalue,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
                  child: InkWell(
                    // onTap: onTapfiltericon,
                    child: Image.asset(
                      AppAssets.filetericon,
                      height: 25,
                      width: 25,
                    ),
                  ),
                )),
            Container(
              height: 290,
              //width:400,
              //color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 30.0, left: 8.0, right: 8.0, top: 8.0),
                child: LineChartBox(
                  spotsl: const [
                    FlSpot(0, 4),
                    FlSpot(1, 3.0),
                    FlSpot(2, 3.5),
                    FlSpot(3.8, 4.1),
                    FlSpot(4.4, 3.8),
                    FlSpot(5.6, 4.3),
                    FlSpot(6.7, 4),
                  ],
                  //  ytitles: _x,
                  // xtitles: _y,
                  // flcolor: [widget.color],
                  // color: [widget.color.withOpacity(.2)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pichart({Function()? onTapfiltericon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkbalue,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: onTapfiltericon,
                    child: Image.asset(
                      AppAssets.filetericon,
                      height: 25,
                      width: 25,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: pchart.PieChart(
                dataMap: dataMap,
                chartLegendSpacing: 80,
                colorList: colorList,
                //chartType: ChartType.,
                chartRadius: MediaQuery.of(context).size.width / 3,
                ringStrokeWidth: 12.0,
                legendOptions: const pchart.LegendOptions(
                    legendShape: BoxShape.circle,
                    legendPosition: pchart.LegendPosition.left,
                    legendTextStyle: TextStyle(color: AppColors.whiteColor)),
                chartValuesOptions: const pchart.ChartValuesOptions(
                  chartValueStyle: TextStyle(color: AppColors.whiteColor),
                  showChartValuesInPercentage: true,
                  showChartValueBackground: false,
                  showChartValuesOutside: true,
                  showChartValues: true,
                  // decimalPlaces: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
