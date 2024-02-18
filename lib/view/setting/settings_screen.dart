import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:sizer/sizer.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool isSwitched = false;
  bool isSwitched1 = false;

  var textValue = 'Switch is OFF';
  void toggleSwitch1(bool value) {
    if (isSwitched1 == false) {
      setState(() {
        isSwitched1 = true;
        textValue = 'Switch Button is ON';
      });
    } else {
      setState(() {
        isSwitched1 = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(
          title: AppStrings.settings.toUpperCase(), isleading: true),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 14.h,
          ),
          pushnotification(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.cardDetails,
              iconPtah: AppAssets.carddetailicon,
              onTap: () {
                AppNavigation.navigateTo(context, Routes.cardDetailsPageRoute);
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.buyPremium,
              iconPtah: AppAssets.buypremiumicon,
              onTap: () {
                AppNavigation.navigateTo(context, Routes.subscriptionPageRoute);
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.termsandConditions,
              iconPtah: AppAssets.termconditionicon,
              onTap: () {
                AppNavigation.navigateTo(
                  context,
                  Routes.termPrivacyPolicyPageRoute,
                  arguments: "TERMS & CONDITIONS",
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.privacyPolicy,
              iconPtah: AppAssets.privacypolicyicon,
              onTap: () {
                AppNavigation.navigateTo(
                    context, Routes.termPrivacyPolicyPageRoute,
                    arguments: "PRIVACY POLICY");
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.logout,
              iconPtah: AppAssets.logouticon,
              onTap: () {
                  AppNavigation.navigateToRemovingAll(context,Routes.preLoginRoute);
             
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buttons({String? text, String? iconPtah, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightblue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
              child: ClipOval(
                  child: Container(
                      height: 40,
                      width: 40,
                      color: AppColors.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(iconPtah ?? "", fit: BoxFit.contain),
                      ))),
            ),
            const SizedBox(width: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                text!,
                style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pushnotification() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightblue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 14.0),
                  child: ClipOval(
                      child: Container(
                          height: 40,
                          width: 40,
                          color: AppColors.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppAssets.bellicon,
                                fit: BoxFit.contain),
                          ))),
                ),
                const SizedBox(width: 20.0),
                Text(
                  AppStrings.pushNotification,
                  style:
                      TextStyle(color: AppColors.whiteColor, fontSize: 12.sp),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Transform.scale(
                  scale: 1.2,
                  child: Switch(
                    onChanged: toggleSwitch1,
                    value: isSwitched1,
                    activeColor: AppColors.whiteColor,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: AppColors.whiteColor,
                    inactiveTrackColor: Colors.grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
