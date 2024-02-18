import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:sizer/sizer.dart';

class FilterSearch extends StatefulWidget {
  FilterSearch({Key? key}) : super(key: key);

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  double value1 = 0;
  double value2 = 0;
  double value3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.filterSearch.toUpperCase()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              height: Platform.isIOS
                  ? (MediaQuery.of(context).size.height * 0.15 -
                      MediaQuery.of(context).size.height * 0.13 * 0.3)
                  : 14.h,
            ),
            SizedBox(height: 10.0),
            Padding(
               padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "MAX BENCH",
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30.0),
            slider(
              value: value1,
              onChanged: (values) {
                setState(() {
                  value1 = values;
                });
              },
            ),
           rowtext("10 lbs","800 lbs"),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "MAX REPS",
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30.0),
            slider(
              value: value2,
              onChanged: (values) {
                setState(() {
                  value2 = values;
                });
              },
            ),
              rowtext("10 Reps","50 Reps"),
            SizedBox(height: 10.0),
            Padding(
                padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "MAX TIME",
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30.0),
            slider(
              value: value3,
              onChanged: (values) {
                setState(() {
                  value3 = values;
                });
              },
            ),
              rowtext("0.5 Hrs","03 Hrs"),
        SizedBox(height: 70.0),
            _buildDialogContent(context),
          ],
        ),
      ),
    );
  }

Widget rowtext(String text1,String text2){
  return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              text1,
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
            Text(
              text2,
              style: TextStyle(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
            ],),
          );
}

Widget _buildDialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: AppColors.secondry,
            boxShadow: [
      BoxShadow(
        color: AppColors.blackColor.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 9,
        offset: Offset(0, 3), // changes position of shadow
      ),
            ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: sizeWidth(context),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: AppColors.primary,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child:   Text("MAX REPS 1 HOUR LONG",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.whiteColor,fontWeight: FontWeight.bold)),
 
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        child:Image.asset(AppAssets.gymicon)),
                    const SizedBox(height: 10.0),
                    Text("300 lbs",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.whiteColor,fontWeight: FontWeight.bold),),
                  ],
                ),
                 Column(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        child:Image.asset(AppAssets.timeFasticon)),
                         const SizedBox(height: 10.0),
                    Text("30 Reps",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.whiteColor,fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            // Text(AppConstant.loremIpsumText,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 13.sp, color: AppColors.blackColor)),
            SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }
  Widget slider({double? value, Function(double)? onChanged}) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          trackHeight: 8.0,
          activeTickMarkColor: AppColors.primary,
          valueIndicatorColor: AppColors.primary,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          thumbColor: Colors.white,
          inactiveTickMarkColor: Colors.transparent),
      child: Slider(
        value: value!,
        min: 0,
        max: 100,
        activeColor: AppColors.primary,
        divisions: 5,
        label: value.round().toString(),
        onChanged: onChanged,
        // (values) {
        //   setState(() {
        //     value1 = values;
        //   });
        // },
      ),
    );
  }
}
