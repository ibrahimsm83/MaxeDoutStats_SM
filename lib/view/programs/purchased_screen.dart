import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:sizer/sizer.dart';

class purchasedView extends StatefulWidget {
  const purchasedView({Key? key}) : super(key: key);

  @override
  State<purchasedView> createState() => _purchasedViewState();
}

class _purchasedViewState extends State<purchasedView> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(6, (index) => programBox(onTap: ()=> AppNavigation.navigateTo(context, Routes.createProgramRoute))),
    );
  }

  Widget programBox( {Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: sizeWidth(context),
        decoration: BoxDecoration(
            color: AppColors.darkbalue,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Text(
                AppStrings.program1,
                style: TextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  AppStrings.loremIpsumtext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
             Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.0),
            child: CustomeButton(
              fontWeight: FontWeight.bold,
              text: AppStrings.create.toUpperCase(),
              onTap:onTap
              
              // () {
              //   // CustomSnacksBar.showSnackBar(context, "Process..");
              //   //AppNavigation.navigateReplacementNamed(context, Routes.deshboardPageRoute);
              // },
            ),
          ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  
  
}
