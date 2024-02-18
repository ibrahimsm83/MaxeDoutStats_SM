import 'dart:io';

import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';

class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(
          title: AppStrings.cardDetails.toUpperCase(), isleading: true),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 14.h,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.creditCard,
              iconPtah: AppAssets.creditcardicon,
              onTap: () {
                //AppNavigation.navigateTo(context, Routes.subscriptionPageRoute);
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.stripe,
              iconPtah: AppAssets.stripeicon,
              onTap: () {
             
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: buttons(
              text: AppStrings.paypal,
              iconPtah: AppAssets.paypalicon,
              onTap: () {
             
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.0),
            child: CustomeButton(
              text: AppStrings.addNew.toUpperCase(),
              onTap: () {
                 AppNavigation.navigateTo(context, Routes.addCardViewRoute);
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
          borderRadius: BorderRadius.circular(15),
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
}
