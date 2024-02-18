import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';

import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/view/deshboard/calender_screen.dart';
import 'package:maxedoutstats/view/deshboard/home_screen.dart';
import 'package:maxedoutstats/view/deshboard/profile_screen.dart';
import 'package:maxedoutstats/view/deshboard/progress_screen.dart';
import 'package:maxedoutstats/widget/custome_appbar.dart';
import 'package:sizer/sizer.dart';

class cuttentindex{
  int currentIndex = 0;
}
class DeshboardPage extends StatefulWidget {
  const DeshboardPage({Key? key}) : super(key: key);
//static GlobalKey<NavigatorState> globalkey = GlobalKey();

  @override
  GlobalKey get key => super.key! as GlobalKey;


  @override
  _DeshboardPageState createState() => _DeshboardPageState();


  void changePage(int index){
    (key.currentState! as _DeshboardPageState).changePage(index);
  }

}

class _DeshboardPageState extends State<DeshboardPage> {

cuttentindex cindex=cuttentindex();

  //int cindex.currentIndex = 0;
  int _homeindex = 0;
  final List<Widget> _pages = [
    const HomePageView(),
    const CalenderPageView(),
    const ProfilePageView(),
    const ProgressPageView(),
    const ProfilePageView(),
  ];
  List<String> titles = [
    AppStrings.home.toUpperCase(),
    AppStrings.calendar.toLowerCase(),
    "",
    AppStrings.userProgress.toUpperCase(),
    AppStrings.profile.toUpperCase(),
  ];
  List<String> actionIcon = ["", "", "", "", AppAssets.settingicon];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondry,
      appBar: CustomeAppbar(
        title: titles[cindex.currentIndex],
        isleading: false,
        action: cindex.currentIndex == 4
            ? InkWell(
                onTap: () {
                  AppNavigation.navigateTo(context, Routes.settingViewRoute);
                },
                child: Image.asset(
                  AppAssets.settingicon,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
      bottomNavigationBar: _buildBottomBar(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(),
      body: _pages[cindex.currentIndex],
    );
  }

  Widget floatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.5)),
      child: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          AppNavigation.navigateTo(context, Routes.newExerciseViewPageRoute);
          // setState(() {
          //   // _homeindex = 1;
          //   // cindex.currentIndex = 1;

          // });
        },
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(AppAssets.addicon)),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      // height: .0,
      //margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.whiteColor)),
        color: AppColors.lightblue,
        //borderRadius: BorderRadius.circular(20.0)
      ),
      child: BottomNavigationBar(
        elevation: 0,
        onTap: (index) {
          changePage(index);
        },
        backgroundColor: Colors.transparent,
        currentIndex: cindex.currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.whiteColor,
        selectedFontSize: 16.0,
        unselectedLabelStyle:
            TextStyle(fontSize: 9.sp, color: AppColors.whiteColor),
        selectedLabelStyle: TextStyle(fontSize: 9.sp, color: AppColors.primary),
        // unselectedFontSize: 16.0,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  AppAssets.homeicon,
                  height: 20,
                  width: 20,
                  color: cindex.currentIndex == 0 ? AppColors.primary : null,
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  AppAssets.calendaricon,
                  height: 20,
                  width: 20,
                  color: cindex.currentIndex == 1 ? AppColors.primary : null,
                ),
              ),
              label: AppStrings.calendar),
          BottomNavigationBarItem(
              icon: Container(
                height: 20,
                width: 20,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  AppAssets.progressicon,
                  height: 20,
                  width: 20,
                  color: cindex.currentIndex == 3 ? AppColors.primary : null,
                ),
              ),
              label: AppStrings.progress),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  AppAssets.profileicon,
                  height: 20,
                  width: 20,
                  color: cindex.currentIndex == 4 ? AppColors.primary : null,
                ),
              ),
              label: AppStrings.profile)
        ],
      ),
    );
  }

  void changePage(int index){
    setState(() {
       cindex.currentIndex = index;
    });
  }
}
