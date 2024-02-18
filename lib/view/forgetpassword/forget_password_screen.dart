
import 'dart:io';

import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/app_logo.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/custome_text_formfield.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
             extendBodyBehindAppBar: true,
         backgroundColor: AppColors.secondry,
      appBar:CustomeAppbar(title: AppStrings.forgotPassword.toUpperCase()
          ),
          body: SingleChildScrollView(
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
              : 15.h,
          ),
                  const AppLogoIcon(),
                  SizedBox(height: sizeHeight(context) * 0.06),
                  Form(
                    key: _formKey,
                    child: CustomeTextField(
                      controller: _emailController,
                      labelText: AppStrings.emailAddress,
                      prefixIcon: Image.asset(
                        AppAssets.emailredicon,
                        width: 2,
                        height: 2,
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
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.0),
                    child: CustomeButton(
                        text: AppStrings.send,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //_emailController.clear();
                            AppNavigation.navigateTo(
                                context, Routes.oTpverifiedRoute);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
  );}
