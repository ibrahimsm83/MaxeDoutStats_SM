import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/custome_text_formfield.dart';
import 'package:sizer/sizer.dart';
class WorkExperienceModel {
  String? number;
  String? title;
  WorkExperienceModel({this.number, this.title});
}
class CreateProgeamPage extends StatelessWidget {
  final _maxRepController = TextEditingController();
  final _masSetsController = TextEditingController();
  final _maxliftController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  CreateProgeamPage({Key? key}) : super(key: key);
 List<WorkExperienceModel> workExpList = [
    WorkExperienceModel(number: "4", title: "Work Exprience"),
    WorkExperienceModel(number: "32", title: "Completed Workout"),
    WorkExperienceModel(number: "21", title: "Active Clients")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.programs.toUpperCase()),
      body: SingleChildScrollView(
        child: Form(
          key:_formKey,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              SizedBox(
                height: Platform.isIOS
                    ? (MediaQuery.of(context).size.height * 0.15 -
                        MediaQuery.of(context).size.height * 0.13 * 0.3)
                    : 14.h,
              ),
              programBox(context),
              const SizedBox(height: 20.0),
              Padding(
              padding:
                        EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomeTextField(
                  labelText: "Max Reps",
                  controller: _maxRepController,
                  keyboardType: TextInputType.number,
                  hinttext: "15",
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return "enter max reps";
                    }
                  },
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
               padding:
                        EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomeTextField(
                  labelText: "Max Sets",
                  controller: _masSetsController,
                  keyboardType: TextInputType.number,
                  hinttext: "15",
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return "enter max sets";
                    }
                  },
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                 padding:
                        EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomeTextField(
                  labelText: "Max Lift",
                  controller: _maxliftController,
                  keyboardType: TextInputType.number,
                  hinttext: "375",
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return "enter max lift";
                    }
                  },
                ),
              ),
                
                
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.0),
                    child: CustomeButton(
                      text: AppStrings.calculate.toUpperCase(),
                      color: AppColors.blackColor,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _masSetsController.clear();
                          _masSetsController.clear();
                          _maxliftController.clear();
                          AppNavigation.navigateTo(
                              context, Routes.oTpverifiedsignupRoute);
                        }
                      },
                    ),
                  ),
                  programBox1(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget programBox1(BuildContext context) {
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    workExpList.length,
                    (index) => workExperience(workExpList[index]),
                  )),
              SizedBox(height: 20.0),
               Padding(
                  padding:EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.0),
                  child: CustomeButton(
                    fontWeight: FontWeight.bold,
                    text: AppStrings.start.toUpperCase(),
                   
                    onTap: () {
                    AppNavigation.navigateTo(context,Routes.continueProgramRoute );
                    },
                  ),
                ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
  Widget workExperience(WorkExperienceModel workModel) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: AppColors.lightblue,
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              workModel.number!,
              style: TextStyle(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              workModel.title!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
 
 
  Widget programBox(BuildContext context) {
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
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
