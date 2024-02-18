import 'dart:async';
import 'dart:io';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/app_logo.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  bool timeUp = false;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    Future.delayed(Duration(seconds: 1), (() => _controller.start()));
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
         backgroundColor: AppColors.secondry,
      appBar:CustomeAppbar(title: AppStrings.createNewAccount
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 SizedBox(height: 20.0),
                      SizedBox(
            height: Platform.isIOS
              ? (MediaQuery.of(context).size.height * 0.15 -
                  MediaQuery.of(context).size.height * 0.13 * 0.3)
              : 15.h,),
               const AppLogoIcon(),
       SizedBox(height: sizeHeight(context) * 0.06),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(AppStrings.hintOptdescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ),
                  SizedBox(height: sizeHeight(context) * 0.04),
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length <= 5) {
                        hasError = true;
                      } else {
                        hasError = false;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15.0),
                      selectedColor: AppColors.lightblue,
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.lightblue,
                      activeFillColor: AppColors.primary,
                      fieldWidth: 45,
                      // fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    //cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    // enableActiveFill: true,
                  
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    textStyle: const TextStyle(color: AppColors.whiteColor),
                    //scrollPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      if (v.length == 6) {
                        AppNavigation.navigateTo(context, Routes.resetPasswordPageRoute);
                      } else {
                        //print(AppConstant.otpValidator);
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.lightblue, shape: BoxShape.circle,
                        border: Border.all(color:AppColors.whiteColor,width: 1.5),
                        
                        ),
                    child: CircularCountDownTimer(
                        duration: 60,
                        height: double.infinity,
                        width: double.infinity,
                        controller: _controller,
                        ringColor: Colors.transparent,
                        fillColor: AppColors.primary,
                        backgroundColor: AppColors.lightblue,
                        strokeWidth: 2.0,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                            fontSize: 16.0, color: AppColors.whiteColor),
                        textFormat: CountdownTextFormat.MM_SS,
                        isReverse: true,
                        isReverseAnimation: true,
                        isTimerTextShown: true,
                        autoStart: false,
                        onComplete: () {
                          setState(() {
                            timeUp = true;
                          });
                        }),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                      padding: EdgeInsets.only(top: 20.0),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.dontreceivecode,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp)),
                          InkWell(
                            onTap: () {
                              if (timeUp) {
                                setState(() {
                                  _controller.start();
                                  timeUp = false;
                                });
                              }
                            },
                            child: Text(AppStrings.resend,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primary,
                                    fontSize: 13.sp)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
}
