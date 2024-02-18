import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:sizer/sizer.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
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
                : 10.h,
          ),
          //
          editwidget(
              onTap: () =>
                  AppNavigation.navigateTo(context, Routes.editProfilePageRoute)),
          imageCircleWidget(),
          const SizedBox(height: 10.0),
          heading(AppStrings.johnSmith),
          heading(AppStrings.addressHintText),
          detailBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.0),
            child: CustomeButton(
              text: AppStrings.addGoal.toUpperCase(),
              onTap: () {
                // CustomSnacksBar.showSnackBar(context, "Process..");
                //AppNavigation.navigateReplacementNamed(context, Routes.deshboardPageRoute);
              },
            ),
          ),
          SizedBox(height: sizeHeight(context) * 0.08),
        ],
      ),
    );
  }

  Widget detailBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkbalue,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              listTile(AppStrings.emailAddress, AppStrings.hintEmailaddress),
              listTile(AppStrings.phone, AppStrings.hintphoneNo),
              listTile(AppStrings.biography, AppStrings.loremIpsumtext),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          subtitle,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp),
        ),
      ),
    );
  }

  Widget heading(String? text) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          text ?? "",
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ),
    );
  }

  Widget editwidget({Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                border: Border.all(color: AppColors.whiteColor)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(AppAssets.editicon),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageCircleWidget() {
    return Container(
      height: sizeHeight(context) * 0.18,
      width: sizeWidth(context) * 0.18,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AppAssets.profileimage), fit: BoxFit.contain),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
          color: AppColors.primary,
          shape: BoxShape.circle),
      //child: Image.asset(AppAssets.cameraIcon),
    );
  }
}
