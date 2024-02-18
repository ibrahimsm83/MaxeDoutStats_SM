import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/image_utility.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/custome_text_formfield.dart';

class EditProfileVew extends StatefulWidget {
  const EditProfileVew({Key? key}) : super(key: key);

  @override
  State<EditProfileVew> createState() => _EditProfileVewState();
}

class _EditProfileVewState extends State<EditProfileVew> {
  final ImagePickerUtility _imagePickerUtility = ImagePickerUtility();
  final _unameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.details),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              width: sizeWidth(context),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: Platform.isIOS
                        ? (MediaQuery.of(context).size.height * 0.15 -
                            MediaQuery.of(context).size.height * 0.13 * 0.3)
                        : 14.h,
                  ),
                  imageCircleWidget(
                    onTap: () async {
                      var selectimageFile =
                          await _imagePickerUtility.pickImageWithReturn(context);
      
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 30.0),
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
                    labelText: AppStrings.address,
                    controller: _addressController,
                    //keyboardType: TextInputType.number,
                    prefixIcon:
                        Image.asset(AppAssets.locationicon, width: 1, height: 1),
                    hinttext: AppStrings.addressHintText,
                    validator: (String? v) {
                      if (v!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.enterAddressText;
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
                  // const SizedBox(height: 20.0),
                  // CustomeTextField(
                  //   labelText: AppStrings.confirmPassword,
                  //   controller: _confirmPasswordController,
                  //   prefixIcon:
                  //       Image.asset(AppAssets.lockredicon, width: 1, height: 1),
                  //   hinttext: AppStrings.hintPassword,
                  //   obscureText: true,
                  //   validator: (String? v) {
                  //     if (v!.isValidPassword) {
                  //       return null;
                  //     } else {
                  //       return AppStrings.passwordvalidator;
                  //     }
                  //   },
                  // ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 20.0),
                    child: CustomeButton(
                      text: AppStrings.saveChanges.toUpperCase(),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _emailController.clear();
                          _unameController.clear();
                          _phoneNumberController.clear();
                          //_confirmPasswordController.clear();
                          Navigator.pop(context);
                          // CustomSnacksBar.showSnackBar(context, "Process..");
                          // AppNavigation.navigateTo(
                          //     context, Routes.oTpverifiedsignupRoute);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageCircleWidget({Function()? onTap}) {
    return Container(
        height:123,
        width:123, 
      child: Stack(
        children: [
        Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: _imagePickerUtility.image != null
                              ? BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primary, width: 4.0),
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(_imagePickerUtility.image!)),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primary, width: 2.0),
                                  image: const DecorationImage(
                                      image: AssetImage(AppAssets.profileimage),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                        ),
                      ),
          //uploadeIcon
                      GestureDetector(
                        onTap: onTap,
                        // () async {
                        //   var selectimageFile = await _imagePickerUtility
                        //       .pickImageWithReturn(context);

                        //   setState(() {});
                        //   // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const CreateMyProfilePg()));
                        // },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 2.0),
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage(AppAssets.cameraicon),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
        ],
      ),
    );
  }
}
