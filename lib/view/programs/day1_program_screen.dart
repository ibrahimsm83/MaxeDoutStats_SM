import 'dart:io';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';

class tabledataModel {
  int? id;
  String? lebs;
  String? rebs;
  bool isChecked;
  tabledataModel({this.id, this.lebs, this.rebs, this.isChecked = false});
}

class DayOneProgram extends StatefulWidget {
  const DayOneProgram({Key? key}) : super(key: key);

  @override
  State<DayOneProgram> createState() => _DayOneProgramState();
}

class _DayOneProgramState extends State<DayOneProgram> {
  bool terms = false;
  List<tabledataModel> _items = [
    tabledataModel(id: 0, lebs: "20 kg", rebs: "10reps", isChecked: true),
    tabledataModel(id: 1, lebs: "20 kg", rebs: "10reps", isChecked: true),
    tabledataModel(id: 2, lebs: "20 kg", rebs: "10reps", isChecked: false),
    tabledataModel(id: 3, lebs: "20 kg", rebs: "10reps", isChecked: true),
    tabledataModel(id: 4, lebs: "20 kg", rebs: "10reps", isChecked: false),
    tabledataModel(id: 5, lebs: "20 kg", rebs: "10reps", isChecked: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.day1programs.toUpperCase()),
     
      body: Stack(
        children: [
         
      SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 14.h,
          ),
            SizedBox(height: 10.0),
            BenchPassWidget(title: "BENCH PASS"),
            SizedBox(height: 20.0),
            BenchPassWidget(title: "ARMS WORKOUT"),
          ],
        ),
      ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.0),
                          child: CustomeButton(
                            //color: Colors.transparent,
                            text: AppStrings.complete.toUpperCase(),
                            onTap: () {
                              // CustomSnacksBar.showSnackBar(context, "Process..");
                              //AppNavigation.navigateReplacementNamed(context, Routes.deshboardPageRoute);
                            },
                          ),
                        ),
              ),
            ),
        ],
      ),
    );
  }
Widget BenchPassWidget({String? title}){
  return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: sizeWidth(context),
              decoration: BoxDecoration(
                  color: AppColors.darkbalue,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title??"",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp)),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.questionicon,
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(width: 10.0),
                          Image.asset(
                            AppAssets.checkicon,
                            height: 18,
                            width: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primary),
                      Text("Warm-Up",
                          style: TextStyle(
                              color: AppColors.primary, fontSize: 9.sp)),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  ...List.generate(
                      _items.length, (index) => rowbox(_items[index])),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primary),
                      Text("Set",
                          style: TextStyle(
                              color: AppColors.primary, fontSize: 9.sp)),
                      SizedBox(height: 5.0),
                      SizedBox(height: 5.0),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  totalWeightRow(),
                ]),
              ),
            ),
          );
}
  Widget totalWeightRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Total Weight",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 9.sp)),
            Text("2.6 ton",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 9.sp)),
          ],
        ),
        Column(
          children: [
            Text("Total reps",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 9.sp)),
            Text("27 reps",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 9.sp)),
          ],
        ),
        Column(
          children: [
            Text("Average Weight",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 9.sp)),
            Text("96.3 kg",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 9.sp)),
          ],
        ),
      ],
    );
  }

  Widget rowbox(tabledataModel tbl) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkbalue,
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Center(
                  child: Text(tbl.id.toString(),
                      style: TextStyle(
                          color: AppColors.whiteColor, fontSize: 10.sp)),
                ),
              ),
              Text(tbl.lebs!,
                  style:
                      TextStyle(color: AppColors.whiteColor, fontSize: 10.sp)),
              Text(tbl.rebs!,
                  style:
                      TextStyle(color: AppColors.whiteColor, fontSize: 10.sp)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tbl.isChecked = !tbl.isChecked;
                    //terms = !terms;
                  });
                },
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: tbl.isChecked ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: tbl.isChecked
                              ? AppColors.whiteColor
                              : AppColors.primary,
                          width: 1)),
                  child: Center(
                    child: tbl.isChecked
                        ? const Icon(
                            Icons.check,
                            color: AppColors.whiteColor,
                            size: 16,
                          )
                        : const Text(""),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
