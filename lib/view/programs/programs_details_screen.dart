import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/view/programs/all_programs_screen.dart';
import 'package:maxedoutstats/view/programs/ongoing_screen.dart';
import 'package:maxedoutstats/view/programs/purchased_screen.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/horizantal_programlist.dart';
import 'package:sizer/sizer.dart';

class ProgramsDetailsPage extends StatefulWidget {
   ProgramsDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProgramsDetailsPage> createState() => _ProgramsDetailsPageState();
}

class _ProgramsDetailsPageState extends State<ProgramsDetailsPage> {
 int selectedid = 0;
List<String> programsName=[
  "ALL PROGRAMS ","PURCHASED","ON GOING"
];
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
             ProgramsCategory(
                selected: selectedid,
                callback: (int index) {
                  setState(() {
                    selectedid = index;
                  });
                  //pageController.jumpToPage(index);
                },
                name:programsName,
              ),

              Flexible(
                child: SingleChildScrollView(child:
                selectedid==0?AllProgramsView(): selectedid==1 ?purchasedView(): selectedid==2?OnGoingView():SizedBox()
                    ),
              ),],
      ),
    );
  }

  
}
