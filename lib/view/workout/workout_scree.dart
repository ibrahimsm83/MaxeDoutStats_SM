import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/customedropdown.dart';
import 'package:maxedoutstats/widget/maxrep_dialogbox.dart';
import 'package:sizer/sizer.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';

class WorkOutView extends StatefulWidget {
  const WorkOutView({Key? key}) : super(key: key);

  @override
  State<WorkOutView> createState() => _WorkOutViewState();
}

class _WorkOutViewState extends State<WorkOutView> {
  final movementList = ["Exercise 1", "select1", "select2"];
  final gripList = ["Exercise 2", "grip1", "grip2"];
  final barList = [AppStrings.bar, "bar1", "bar2"];
  final resistanceList = [AppStrings.Resistance, "resistance1", "resistance2"];
  String movemen = "Exercise 1";
  String bar = AppStrings.bar;
  String grip = "Exercise 2";
  String resistance = AppStrings.Resistance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.secondry,
        appBar: CustomeAppbar(title: AppStrings.workout.toUpperCase()),
        body: SingleChildScrollView(
            child: Form(
                //  key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      width: sizeWidth(context),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: Platform.isIOS
                                  ? (MediaQuery.of(context).size.height * 0.15 -
                                      MediaQuery.of(context).size.height *
                                          0.13 *
                                          0.3)
                                  : 14.h,
                            ),
                            const SizedBox(height: 20.0),
                            CustomeDropDownButton(
                                horizantalmergin: 0.0,
                                value: movemen,
                                itemList: movementList,
                                onChanged: (String? value) {
                                  return setState(
                                    () => movemen = value!,
                                  );
                                }),
                            const SizedBox(height: 20.0),
                            rowfield(
                                widget1: WorkoutInputFileds(
                                    hintext: AppStrings.noofReps),
                                widget2: WorkoutInputFileds(
                                    hintext: AppStrings.weight)),
                            const SizedBox(height: 20.0),
                            CustomeDropDownButton(
                                horizantalmergin: 0.0,
                                value: grip,
                                itemList: gripList,
                                onChanged: (String? value) {
                                  return setState(
                                    () => grip = value!,
                                  );
                                }),
                            const SizedBox(height: 20.0),
                            rowfield(
                                widget1: WorkoutInputFileds(
                                    hintext: AppStrings.noofReps),
                                widget2: WorkoutInputFileds(
                                    hintext: AppStrings.weight)),
                            const SizedBox(height: 20.0),
                            addbutton(),
                            const SizedBox(height: 20.0),
                            rowfield(
                                widget1: WorkoutInputFileds(
                                    hintext: AppStrings.noofReps),
                                widget2: WorkoutInputFileds(
                                    hintext: AppStrings.weight)),
                            const SizedBox(height: 20.0),
                            CustomeDropDownButton(
                                horizantalmergin: 0.0,
                                value: grip,
                                itemList: gripList,
                                onChanged: (String? value) {
                                  return setState(
                                    () => grip = value!,
                                  );
                                }),
                            const SizedBox(height: 20.0),
                            rowfield(
                                widget1: WorkoutInputFileds(
                                    hintext: AppStrings.noofReps),
                                widget2: WorkoutInputFileds(
                                    hintext: AppStrings.weight)),
                            const SizedBox(height: 20.0),
                            addbutton(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 20.0),
                              child: CustomeButton(
                                text: AppStrings.maxRep.toUpperCase(),
                                onTap: () {
                                  AppNavigation.navigateTo(
                            context, Routes.FilterSearchRoute);
                          //          showDialog(
                          // context: context,
                          // builder: (context) {
                            //return CustomMakeMoneyDialog();
                          }
                          
                                
                                  //Navigator.pop(context);
                                //},
                              ),
                            ),
                            CustomeButton(
                              text: AppStrings.complete.toUpperCase(),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(height: 20.0)
                          ]),
                    )))));
  }
  Widget addbutton() {
    return Container(
      width: sizeWidth(context) / 2.2,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          AppStrings.add.toUpperCase(),
          style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp),
        ),
      )),
    );
  }

  Widget rowfield({Widget? widget1, Widget? widget2}) {
    return Row(
      children: [
        Flexible(child: widget1!),
        Flexible(child: widget2!),
      ],
    );
  }
}

class WorkoutInputFileds extends StatelessWidget {
  WorkoutInputFileds({
    Key? key,
    this.hintext,
  }) : super(key: key);
  String? hintext;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 50,
        width: sizeWidth(context),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          //showCursor: false,
          style: const TextStyle(color: AppColors.whiteColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 8),
            filled: true,
            fillColor: AppColors.lightblue,
            hintText: hintext,
            hintStyle: TextStyle(color: Colors.grey.shade300),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.primary)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.primary)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
    );
  }
}
