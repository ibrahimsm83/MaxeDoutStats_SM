import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class WorkExperienceModel {
  String? number;
  String? title;
  WorkExperienceModel({this.number, this.title});
}

class OnGoingView extends StatefulWidget {
  const OnGoingView({Key? key}) : super(key: key);

  @override
  State<OnGoingView> createState() => _OnGoingViewState();
}

class _OnGoingViewState extends State<OnGoingView> {
  List<WorkExperienceModel> workExpList = [
    WorkExperienceModel(number: "4", title: "Work Exprience"),
    WorkExperienceModel(number: "32", title: "Completed Workout"),
    WorkExperienceModel(number: "21", title: "Active Clients")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        programBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            elevation: 0,
            color: AppColors.lightblue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              //borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: ExpansionTile(
                backgroundColor: AppColors.darkbalue,
                //collapsedBackgroundColor: Colors.green,
                collapsedTextColor: AppColors.whiteColor,
                collapsedIconColor: AppColors.whiteColor,
                iconColor: AppColors.whiteColor,
                textColor: AppColors.whiteColor,
                title: Text(
                  "WEEK ONE",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      // color: AppColors.primary,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.7, 0.0),
                          colors: [
                            AppColors.primary, // Color(0xff5851db),
                            AppColors.primary,
                          ],
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          "WEEK ONE",
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor),
                        ),
                        trailing: Image.asset(AppAssets.arrowforwardicon,
                            height: 15,
                            width: 15,
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget programBox() {
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
              LinearPercentIndicator(
                  barRadius: const Radius.circular(20.0),
                  animation: true,
                  lineHeight: 12.0,
                  animationDuration: 2000,
                  percent: 0.5,
                  progressColor: AppColors.primary),
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
}
