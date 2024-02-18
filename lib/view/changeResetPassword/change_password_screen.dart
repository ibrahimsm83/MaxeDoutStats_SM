import 'dart:io';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/app_logo.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/custome_text_formfield.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _confpassController = TextEditingController();
  final _passController = TextEditingController();
   final _exixtingpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.secondry,
        appBar: CustomeAppbar(title: AppStrings.resetPassword.toUpperCase()),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: Platform.isIOS
                        ? (MediaQuery.of(context).size.height * 0.15 -
                            MediaQuery.of(context).size.height * 0.13 * 0.3)
                        : 15.h,
                  ),
                  const AppLogoIcon(),
                  SizedBox(height: sizeHeight(context) * 0.06),
                    CustomeTextField(
                      labelText: AppStrings.existingPassword,
                      controller: _exixtingpassController,
                      hinttext: AppStrings.hintPassword,
                      obscureText: true,
                      validator: (String? v) {
                        if (v!.isValidPassword) {
                          return null;
                        } else {
                          return AppStrings.passwordvalidator;
                        }
                      },),
                         const SizedBox(height: 20.0),
                  CustomeTextField(
                    labelText: AppStrings.newPassword,
                    controller: _passController,
                    hinttext: "*****************",
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
                    labelText: AppStrings.confirmNewPassword,
                    controller: _confpassController,
                    hinttext: "Abcd@1234",
                    obscureText: true,
                    validator: (String? v) {
                      if (v!.isValidPassword) {
                        return null;
                      } else {
                        return AppStrings.passwordvalidator;
                      }
                    },
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.0),
                    child: CustomeButton(
                      text: AppStrings.cHANGE.toUpperCase(),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // AppNavigation.navigateReplacementNamed(
                          //     context, Routes.loginRoute);
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
