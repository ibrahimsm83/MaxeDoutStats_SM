import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LineChartBox extends StatelessWidget {
  final List<String> ytitles;
  final List<String> xtitles;
  final List<FlSpot> spotsl;
  final List<Color> color;
  final List<Color> flcolor;
  final String Function(double)? getTitlesY;
  final String Function(double)? getTitlesX;

  LineChartBox({
    Key? key,
    this.getTitlesY,
    this.getTitlesX,
    this.color = const [],
    this.spotsl = const [],
    this.xtitles = const [],
    this.ytitles = const [],
    this.flcolor = const [],
  }) : super(key: key);
  List<Color> gradientColors = [
    AppColors.primary,
    AppColors.primary.withOpacity(0.8)
  ];
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        // minX: 0,
        // minY: 0,
        // maxX: xtitles.length - 1,
        // maxY: ytitles.length - 1,
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 7,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          //drawVerticalLine: true,
          getDrawingHorizontalLine: (_) => FlLine(
              strokeWidth: 0.1.w,
              color: Colors.grey // ProjectColors.gray.withOpacity(0.3),
              ),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            //reservedSize: 32,
            // interval: ,
            //margin: 12,
            //reservedSize: 150,
            showTitles: true,
            getTitles: //(value) => xtitles[value.toInt()],
                (value) {
              switch (value.toInt()) {
                case 0:
                  return 'W1';
                case 1:
                  return 'W2';
                case 2:
                  return 'W3';
                case 3:
                  return 'W4';
                case 4:
                  return 'W5';
                case 5:
                  return 'W6';
              }
              return '';
            },
            getTextStyles: (_, value) =>
                TextStyle(color: Colors.grey, fontSize: 9.sp

                    ///fontFamily: 'sansPro-semiBold',
                    // fontSize: (isTablet ? 12 : 10).mv,
                    ),
          ),
          leftTitles: SideTitles(
            // margin: 30,
            reservedSize: 50,
            interval: 1.0,
            showTitles: true,
            getTitles: //(value) => ytitles[value.toInt()],
                (value) {
              switch (value.toInt()) {
                // case 10:
                //   return '1.0';
                // case 9:
                //   return '0.9';

                case 7:
                  return '800 LBS';
                case 6:
                  return '700 LBS';
                case 5:
                  return '600 LBS';
                case 4:
                  return '500 LBS';
                case 3:
                  return '400 LBS';
                case 2:
                  return '300 LBS';
                case 1:
                  return '200 LBS';
              }
              return '100 LBS';
            },
            getTextStyles: (_, value) =>
                TextStyle(color: Colors.grey, fontSize: 9.sp
                    // fontFamily: 'sansPro-semiBold',
                    // fontSize: (isTablet ? 12 : 10).mv,
                    ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            top: BorderSide(
              width: 0.1.w,
              color: Colors.grey,
            ),
            bottom: BorderSide(
              width: 0.1.w,
              color: Colors.grey,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spotsl,
            isCurved: true,
            barWidth: 1.0,
            colors: // flcolor,
                [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              colors: //color,
                  gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
