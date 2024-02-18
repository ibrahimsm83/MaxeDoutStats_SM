import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:sizer/sizer.dart';

class ProgressModel {
  String? title;
  ProgressModel({
    this.title,
  });
}

class ProgressDialog extends StatefulWidget {
  const ProgressDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressDialog> createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;

  List<ProgressModel> progressList = [
    ProgressModel(title: AppStrings.daily),
    ProgressModel(title: AppStrings.weekly),
    ProgressModel(title: AppStrings.monthly),
  ];
  List<String> areaList = [
    AppStrings.all,
    AppStrings.chest,
    AppStrings.back,
    AppStrings.biceps,
    AppStrings.triceps,
    AppStrings.shoulders
  ];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _scaleAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    _animationController!.addListener(() {
      setState(() {});
    });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scaleAnimation!,
        child: Dialog(
          elevation: 0,
          backgroundColor: AppColors.darkbalue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(child: _buildDialogContent(context)),
        ));
  }

  bool terms = false;
  bool privacy = false;
  bool isArea = false;
  int selectedIndex = 0;
  int selectedAreaIndex = 0;
  Widget _buildDialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        header(),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 250,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.0),
            itemCount: 3,
            itemBuilder: (cotext, index) {
              return GestureDetector(
                  onTap: () => setState(() {
                        selectedIndex = index;
                        isArea = true;
                      }),
                  //onLongPress: () => setState(() => isArea = true),
                  child: chartviewbox(pgd: progressList[index], ind: index));
            },
          ),
        ),
        //area
        areaWidget(),
      ],
    );
  }

  Widget header() {
    return Container(
      width: sizeWidth(context),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(AppStrings.chartView.toUpperCase(),
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 13.sp, color: AppColors.whiteColor)),
            ),
            InkWell(
              onTap: () {
                _animationController!.reverse();
                Navigator.pop(context);
              },
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppAssets.cancelicon)),
            ),
          ],
        ),
      ),
    );
  }

  Widget areaWidget() {
    return Visibility(
      visible: isArea,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(AppStrings.area.toUpperCase(),
                style: TextStyle(fontSize: 13.sp, color: AppColors.whiteColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: areaList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() => selectedAreaIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightblue,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: selectedAreaIndex == index
                              ? AppColors.primary
                              : AppColors.lightblue),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            areaList[index],
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 14.sp),
                          ),
                          Visibility(
                              visible: selectedAreaIndex == index,
                              child: Image.asset(
                                AppAssets.circleicon,
                                height: 20,
                                width: 20,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget chartviewbox({ProgressModel? pgd, int? ind}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: sizeWidth(context),
        decoration: BoxDecoration(
          color: AppColors.lightblue,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: selectedIndex == ind
                  ? AppColors.primary
                  : AppColors.lightblue),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pgd!.title ?? "",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp),
              ),
              Visibility(
                  visible: selectedIndex == ind,
                  child: Container(
                    child: Image.asset(
                      AppAssets.circleicon,
                      height: 20,
                      width: 20,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
