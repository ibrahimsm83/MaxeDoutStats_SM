import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  CarouselController buttonCarouselController = CarouselController();
  List subscription = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(
          title: AppStrings.competitionlist.toUpperCase(), isleading: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              height: Platform.isIOS
                  ? (MediaQuery.of(context).size.height * 0.15 -
                      MediaQuery.of(context).size.height * 0.13 * 0.3)
                  : 14.h,
            ),
            CarouselSlider(
              options: CarouselOptions(
                 height: 450,
                //aspectRatio: 16 / 17,
                
                enlargeCenterPage: true,
              ),
              items: [
                48.00,
                100.0,
                150.0,
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Text(
                                    AppStrings.yearlyPro.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Text(
                                    '\$$i /YEAR',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                details(text: AppStrings.adfreeinterface),
                                details(text: AppStrings.advancedanalytics),
                                details(text: AppStrings.unlimitedprojects),
                                details(text: AppStrings.allmusicandsoundeffect),
                                SizedBox(height: 2.h),
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typessetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.grey.shade300),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.0),
              child: CustomeButton(
                  text: AppStrings.subscribetopro.toUpperCase(), onTap: () {
                    Navigator.pop(context);
                  }),
            ),
            Text(
              AppStrings.restoreyourpurchase,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 13.sp,
                  color: AppColors.whiteColor),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.subscriptionsbilled,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, color: AppColors.lightblue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget details({String? text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(AppAssets.circleCheckWhiteicon, height: 25, width: 25),
          SizedBox(width: 3.w),
          Text(
            text ?? "",
            //AppStrings.adfreeinterface,
            style: TextStyle(fontSize: 13.sp, color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
