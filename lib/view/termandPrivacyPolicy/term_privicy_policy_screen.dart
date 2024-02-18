import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TermPrivacyPolicyView extends StatelessWidget {
  String? title;
  
  TermPrivacyPolicyView({Key? key,this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: title, isleading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              SizedBox(
                height: Platform.isIOS
                    ? (MediaQuery.of(context).size.height * 0.15 -
                        MediaQuery.of(context).size.height * 0.13 * 0.3)
                    : 14.h,
              ),
              const Text(
                ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                textAlign: TextAlign.justify,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              const Text(
                ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          ''',
                style: TextStyle(color: AppColors.whiteColor),
                textAlign: TextAlign.justify,
              ),
              const Text(
                ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          ''',
                textAlign: TextAlign.justify,
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
