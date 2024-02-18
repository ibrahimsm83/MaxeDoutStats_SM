import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/image_utility.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/custome_text_formfield.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ImagePickerUtility _imagePickerUtility = ImagePickerUtility();
  final _unameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _desiredWeightController = TextEditingController();
  final _ageController = TextEditingController();
  final _currentWeightController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.createNewAccount),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                SizedBox(
                    height: Platform.isIOS
                        ? (MediaQuery.of(context).size.height * 0.15 -
                            MediaQuery.of(context).size.height * 0.13 * 0.3)
                        : 15.h),
                InkWell(
                  onTap: () async {
                    var selectimageFile =
                        await _imagePickerUtility.pickImageWithReturn(context);

                    setState(() {});
                  },
                  child: Container(
                    height: sizeHeight(context) * 0.18,
                    width: sizeWidth(context) * 0.18,
                    decoration: _imagePickerUtility.image != null
                        ? BoxDecoration(
                            image: DecorationImage(
                                image:
                                    FileImage(File(_imagePickerUtility.image!)),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.8),
                                spreadRadius: 5,
                                blurRadius: 5,
                              ),
                            ],
                            color: AppColors.primary,
                            shape: BoxShape.circle)
                        : BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.cameraicon),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.8),
                                spreadRadius: 5,
                                blurRadius: 5,
                              ),
                            ],
                            color: AppColors.primary,
                            shape: BoxShape.circle),
                    //child: Image.asset(AppAssets.cameraIcon),
                  ),
                ),
                SizedBox(height: sizeHeight(context) * 0.04),
                CustomeTextField(
                  labelText: AppStrings.username,
                  controller: _unameController,
                  prefixIcon:
                      Image.asset(AppAssets.usericon, width: 1, height: 1),
                  hinttext: "jhon Smith",
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.enterUserNameText;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.emailAddress,
                  controller: _emailController,
                  prefixIcon: Image.asset(
                    AppAssets.emailredicon,
                    width: 1,
                    height: 1,
                  ),
                  hinttext: AppStrings.hintEmailaddress,
                  validator: (String? v) {
                    if (v!.isValidEmail) {
                      return null;
                    } else {
                      return AppStrings.emailValidator;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.password,
                  controller: _passwordController,
                  prefixIcon:
                      Image.asset(AppAssets.lockredicon, width: 1, height: 1),
                  hinttext: AppStrings.hintPassword,
                  obscureText: true,
                  validator: (String? v) {
                    if (v!.isValidPassword) {
                      return null;
                    } else {
                      return AppStrings.passwordvalidator;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.confirmPassword,
                  controller: _confirmPasswordController,
                  hinttext: AppStrings.hintPassword,
                  prefixIcon:
                      Image.asset(AppAssets.lockredicon, width: 1, height: 1),
                  obscureText: true,
                  validator: (String? v) {
                    if (v!.isValidPassword) {
                      return null;
                    } else {
                      return AppStrings.passwordvalidator;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.phone,
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Image.asset(
                    AppAssets.callicon,
                    width: 1,
                    height: 1,
                  ),
                  hinttext: AppStrings.hintphoneNo,
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.phoneNumberValidator;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.currentWeight,
                  controller: _currentWeightController,
                  keyboardType: TextInputType.number,
                  prefixIcon:
                      Image.asset(AppAssets.weighticon, width: 1, height: 1),
                  hinttext: AppStrings.hintweight,
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.currentWeightValidator;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.desiredWeight,
                  controller: _desiredWeightController,
                  keyboardType: TextInputType.number,
                  prefixIcon:
                      Image.asset(AppAssets.weighticon, width: 1, height: 1),
                  hinttext: AppStrings.hintDesiredWeight,
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.desiredWeightValidator;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                CustomeTextField(
                  labelText: AppStrings.age,
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  prefixIcon:
                      Image.asset(AppAssets.ageicon, width: 1, height: 1),
                  hinttext: AppStrings.hintage,
                  validator: (String? v) {
                    if (v!.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.enterageValidateText;
                    }
                  },
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 20.0),
                  child: CustomeButton(
                    text: AppStrings.create,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _emailController.clear();
                        _unameController.clear();
                        _passwordController.clear();
                        _phoneNumberController.clear();
                        _currentWeightController.clear();
                        _currentWeightController.clear();
                        _desiredWeightController.clear();
                        _confirmPasswordController.clear();
                        // CustomSnacksBar.showSnackBar(context, "Process..");
                        AppNavigation.navigateTo(
                            context, Routes.oTpverifiedsignupRoute);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
