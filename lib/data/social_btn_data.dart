import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';

class socialbtnmodel {
  String? text;
  String? iconPath;
  Color? bgcolor;
  socialbtnmodel(this.text, this.iconPath, this.bgcolor);
}

List<socialbtnmodel> socilabtnList = [
  socialbtnmodel(
      AppStrings.loginwithemail, AppAssets.emailwhiteicon, AppColors.primary),
  socialbtnmodel(
      AppStrings.loginwithFacebook, AppAssets.facebookicon, AppColors.facebookbtnColor),
  socialbtnmodel(
      AppStrings.loginwithGoogle, AppAssets.googlewicon, AppColors.googlebtnColor),
  socialbtnmodel(
      AppStrings.loginwithApple, AppAssets.appleicon, AppColors.blackColor),
];
