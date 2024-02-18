import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:maxedoutstats/widget/custome_button.dart';
import 'package:maxedoutstats/widget/customedropdown.dart';
import 'package:sizer/sizer.dart';


class NewExerciseView extends StatefulWidget {
  const NewExerciseView({Key? key}) : super(key: key);

  @override
  State<NewExerciseView> createState() => _NewExerciseViewState();
}

class _NewExerciseViewState extends State<NewExerciseView>
    with SingleTickerProviderStateMixin {
  final movementList = [AppStrings.movement, "select1", "select2"];
  final gripList = [AppStrings.grip, "grip1", "grip2"];
  final barList = [AppStrings.bar, "bar1", "bar2"];
  final resistanceList = [AppStrings.Resistance, "resistance1", "resistance2"];
  String movemen = AppStrings.movement;
  String bar = AppStrings.bar;
  String grip = AppStrings.grip;
  String resistance = AppStrings.Resistance;

  final _formKey = GlobalKey<FormState>();

// controller object
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  int indexindicator = 0;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(title: AppStrings.newExercise.toUpperCase()),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                        : 14.h,
                  ),
                  //toggleButotn(),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        searhfield(),
                        const SizedBox(height: 20.0),
                        CustomeDropDownButton(
                            horizantalmergin: 0.0,
                            value: movemen,
                            itemList: movementList,
                            onChanged: (String? value) {
                              return setState(
                                () => movemen = value!,
                              );
                            }),
                        const SizedBox(height: 20.0),
                        CustomeDropDownButton(
                            horizantalmergin: 0.0,
                            value: grip,
                            itemList: gripList,
                            onChanged: (String? value) {
                              return setState(
                                () => grip = value!,
                              );
                            }),
                        const SizedBox(height: 20.0),
                        CustomeDropDownButton(
                            horizantalmergin: 0.0,
                            value: bar,
                            itemList: barList,
                            onChanged: (String? value) {
                              return setState(
                                () => bar = value!,
                              );
                            }),
                        const SizedBox(height: 20.0),
                        CustomeDropDownButton(
                            horizantalmergin: 0.0,
                            value: resistance,
                            itemList: resistanceList,
                            onChanged: (String? value) {
                              return setState(
                                () => resistance = value!,
                              );
                            }),
                        const SizedBox(height: 20.0),
                        supersetText(),
                        const SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20.0),
                          child: CustomeButton(
                            text: AppStrings.continues.toUpperCase(),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                AppNavigation.navigateReplacementNamed(
                                    context, Routes.workOutViewRoute);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget supersetText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.whiteColor),
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 10.0),
          const Text(
            AppStrings.supersets,
            style: TextStyle(color: AppColors.whiteColor),
          )
        ],
      ),
    );
  }

  Widget searhfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 50,
        width: sizeWidth(context),
        child: TextField(
          //showCursor: false,
          style: const TextStyle(color: AppColors.whiteColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 8),
            filled: true,
            fillColor: AppColors.lightblue,
            hintText: AppStrings.type,
            hintStyle: TextStyle(color: Colors.grey.shade300),
            suffixIcon: const Icon(
              Icons.search,
              color: AppColors.whiteColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.primary)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: AppColors.primary)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
    );
  }

  Widget toggleButotn() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightblue,
          borderRadius: BorderRadius.circular(20.0)),
      child: TabBar(
        onTap: (int index) {
          setState(() {
            indexindicator = index;
          });
        },
        controller: _tabController,
        labelStyle:
            const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        labelColor: AppColors.whiteColor,
        unselectedLabelStyle:
            const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        unselectedLabelColor: AppColors.whiteColor,
        indicator: indexindicator == 0
            ? BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                color: AppColors.primary)
            : BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                color: AppColors.primary),
        tabs: [
          Tab(
            child: Text(AppStrings.exercise.toUpperCase()),
            height: 48.0,
          ),
          Tab(
            child: Text(AppStrings.competition.toUpperCase()),
            height: 48.0,
          ),
        ],
      ),
    );
  }
}
