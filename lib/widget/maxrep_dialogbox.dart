import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';

class CustomMakeMoneyDialog extends StatefulWidget {
  CustomMakeMoneyDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomMakeMoneyDialog> createState() => _CustomMakeMoneyDialogState();
}

class _CustomMakeMoneyDialogState extends State<CustomMakeMoneyDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
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
          backgroundColor: AppColors.lightblue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
              child: _buildDialogContent(
            context,
          )),
        ));
  }

  Widget _buildDialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: sizeWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: AppColors.primary,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                Text("MAX REPS 1 HOUR LONG",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13.sp, color: AppColors.whiteColor)),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Container(
                      height: 15,
                      width: 15,
                      child: Image.asset(AppAssets.cancelicon)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child:Image.asset(AppAssets.gymicon)),
                const SizedBox(height: 10.0),
                Text("300 lbs",
                    style: TextStyle(
                        fontSize: 13.sp, color: AppColors.whiteColor,fontWeight: FontWeight.bold),),
              ],
            ),
             Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child:Image.asset(AppAssets.timeFasticon)),
                     const SizedBox(height: 10.0),
                Text("30 Reps",
                    style: TextStyle(
                        fontSize: 13.sp, color: AppColors.whiteColor,fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        // Text(AppConstant.loremIpsumText,
        //         textAlign: TextAlign.center,
        //         style: TextStyle(fontSize: 13.sp, color: AppColors.blackColor)),
        SizedBox(height: 30.0),
      ],
    );
  }
}
