import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/custome_text_formfield.dart';
import 'package:sizer/sizer.dart';

class AddCardView extends StatefulWidget {
  AddCardView({Key? key}) : super(key: key);

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final _stirpController = TextEditingController();
  final _usernameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  late var selectdate;
  @override
  void initState() {
    selectdate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(
          title: AppStrings.addCard.toUpperCase(), isleading: true),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              height: Platform.isIOS
                  ? (MediaQuery.of(context).size.height * 0.15 -
                      MediaQuery.of(context).size.height * 0.13 * 0.3)
                  : 14.h,
            ),
            const SizedBox(height: 20.0),
            creditcard(controller: _stirpController),
            const SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.0),
              child: CustomeTextField(
                //labelText: AppStrings.johnSmith,
                controller: _usernameController,
                prefixIcon: const Icon(Icons.person, color: AppColors.primary),
                hinttext: AppStrings.johnSmith,
                validator: (String? v) {
                  if (v!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter UserName";
                  }
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: rowfield(
                  controller1: _expiryDateController,
                  onTap1: () {
                    
                    showDate(
                      context,
                    ).then((value) => setState(() {}));
                  },
                  controller2: _cvvController),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.0),
              child: CustomeButton(
                text: AppStrings.saveCard.toUpperCase(),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _stirpController.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                  }

                  //AppNavigation.navigateTo(context, Routes.addCardViewRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget creditcard({TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightblue,
            borderRadius: BorderRadius.circular(30.0)),
        height: 45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 25,
                  width: 25,
                  child: Image.asset(AppAssets.creditcardicon,
                      color: AppColors.primary)),
              Flexible(
                  child: TextField(
                      controller: controller,
                      style: const TextStyle(color: AppColors.whiteColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        contentPadding: const EdgeInsets.fromLTRB(12, 0, 3, 0),
                        hintText: AppStrings.cardhinttext,
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6)),
                        border: InputBorder.none,
                      ))),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 15,
                      width: 2.0,
                      color: AppColors.whiteColor.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      AppAssets.stripeicon,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowfield({
    Widget? widget1,
    TextEditingController? controller1,
    void Function()? onTap1,
    Widget? widget2,
    TextEditingController? controller2,
  }) {
    return Row(
      children: [
        Flexible(
          child: CustomeTextField(
            //labelText: "Email Address",
            onTap:onTap1 ,
            readOnly: true,
            controller: _expiryDateController,
            prefixIcon: Image.asset(
              AppAssets.calendarRedicon,
              width: 0.8,
              height: 0.8,
            ),
            hinttext: AppStrings.expireDate,
            keyboardType: TextInputType.number,
            validator: (String? v) {
              if (v!.isNotEmpty) {
                return null;
              } else {
                return "Enter Expire Date";
              }
            },
          ),
        ),
        SizedBox(width: 10.0),
        Flexible(
          child: CustomeTextField(
            //labelText: "Email Address",
            // controller: _emailController,
            prefixIcon: Image.asset(AppAssets.lockredicon, width: 1, height: 1),
            hinttext: AppStrings.cVV,
            keyboardType: TextInputType.number,
            validator: (String? v) {
              if (v!.isNotEmpty) {
                return null;
              } else {
                return "Enter CVV";
              }
            },
          ),
        ),
      ],
    );
  }

  Future showDate(
    context,
  ) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(2050, 1),
        builder: (BuildContext context, Widget? picker) {
          return Theme(
            data: ThemeData.dark().copyWith(primaryColor: AppColors.primary),
            child: picker!,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          selectdate = selectedDate;
        });
        _expiryDateController.text = selectedDate.toString().toDateFormate();
      }
    });
  }
}
