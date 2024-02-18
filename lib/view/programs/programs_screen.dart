import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:sizer/sizer.dart';

class ProgramsPage extends StatelessWidget {
  const ProgramsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.programs.toUpperCase()),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 14.h,
          ),
          list(text: "Program 1",onTap: (){
              AppNavigation.navigateTo(context, Routes.programsDetailsPageRoute);
          }),
          list(text:"Program 2",onTap: (){
              AppNavigation.navigateTo(context, Routes.dayOneProgramRoute);}),
          list(text:"Program 3"),
        ],
      ),
    );
  }
  Widget list({String? text,Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightblue,
            borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          onTap: onTap,
          title: Text(
           text??"",
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
