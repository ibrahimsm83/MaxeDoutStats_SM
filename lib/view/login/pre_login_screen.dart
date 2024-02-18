import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/app_logo.dart';
import 'package:maxedoutstats/widget/social_button.dart';
import 'package:maxedoutstats/data/social_btn_data.dart';
import 'package:maxedoutstats/widget/custome_dialogbox.dart';
import 'package:maxedoutstats/widget/custome_appbar_clipper.dart';

class PreLoginview extends StatelessWidget {
  const PreLoginview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(kToolbarHeight * 1.7),
        child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            // constraints: BoxConstraints.expand(),
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: const SafeArea(
              child: Text(
                "Pre Login",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
      body: Container(
        width: sizeWidth(context),
        color: AppColors.secondry,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
         const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 15.h,
          ),
          const AppLogoIcon(),
          SizedBox(height: sizeHeight(context) * 0.06),
          EmailSignIn(context),
          const SizedBox(height: 12.0),
          FacebookSignIn(context),
          const SizedBox(height: 12.0),
          GoogleSignIn(context),
          const SizedBox(height: 12.0),
          AppleSignIn(context),
          const Spacer(),
          textspan(context),
          const SizedBox(height: 30.0),
        ]),
      ),
    );
  }

  Widget textspan(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 50.0),
        alignment: Alignment.center,
        child: RichText(
            text: TextSpan(
                text: AppStrings.donthaveanaccount,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.whiteColor,
                  // fontFamily: 'playDisplay'
                ),
                children: <TextSpan>[
              TextSpan(
                text: AppStrings.signuphere,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigation.navigateTo(context, Routes.signUpviewRoute);
                  },
              )
            ])));
  }

//Apple SignIn button
  Widget AppleSignIn(BuildContext context) {
    return Visibility(
      visible: Platform.isIOS,
      child: SocialButtons(
          text: socilabtnList[3].text,
          bgcolor: socilabtnList[3].bgcolor,
          assetName: socilabtnList[3].iconPath,
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(navigateto: '/deshboardPage');
                });
          }),
    );
  }

  //Email SignIn button
  Widget EmailSignIn(BuildContext context) {
    return SocialButtons(
        text: socilabtnList[0].text,
        bgcolor: socilabtnList[0].bgcolor,
        assetName: socilabtnList[0].iconPath,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(navigateto: Routes.loginRoute);
              });
        });
  }

  //Facebook SignIn button
  Widget FacebookSignIn(BuildContext context) {
    return SocialButtons(
        text: socilabtnList[1].text,
        bgcolor: socilabtnList[1].bgcolor,
        assetName: socilabtnList[1].iconPath,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(navigateto: '/deshboardPage');
              });
        });
  }

  //Google SignIn button
  Widget GoogleSignIn(BuildContext context) {
    return SocialButtons(
        text: socilabtnList[2].text,
        bgcolor: socilabtnList[2].bgcolor,
        assetName: socilabtnList[2].iconPath,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(navigateto: '/deshboardPage');
              });
        });
  }
}
