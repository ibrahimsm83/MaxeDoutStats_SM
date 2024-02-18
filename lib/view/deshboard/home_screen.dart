import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/view/deshboard/deshboard_screen.dart';
import 'package:sizer/sizer.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  cuttentindex cindex = cuttentindex();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                    MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 15.h,
          ),
          upcoimgImage(),
          const SizedBox(height: 20.0),
          _buildSlider(),
          const SizedBox(height: 20.0),
          listtiel(
              title: AppStrings.volumeTracker,
              leadingiconPath: AppAssets.volumeTrackericon,
              trallingiconpath: AppAssets.arrowforwardicon,
              onTap: () {
                (RouteGenerator.dashboardKey.currentWidget as DeshboardPage)
                    .changePage(3);
                // setState(() {
                //   cindex.currentIndex = 3;
                //   print(cindex.currentIndex);
                // });
              }),
          listtiel(
            title: AppStrings.programs,
            leadingiconPath: AppAssets.programsicon,
            trallingiconpath: AppAssets.arrowforwardicon,
            onTap: () => 
            // AppNavigation.navigateTo(
            //     context, Routes.programsPageRoute),
                AppNavigation.navigateTo(context, Routes.programsDetailsPageRoute),
          ),
          listtiel(
              title: AppStrings.coaching,
              leadingiconPath: AppAssets.coachingicon,
              trallingiconpath: AppAssets.arrowforwardicon),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 10.0),
          itemCount: 10,
          itemBuilder: (context, index) => containerbox()),
    );
  }

  Widget upcoimgImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
              image: AssetImage(AppAssets.upcomingImage), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget listtiel(
      {String? leadingiconPath,
      String? title,
      String? trallingiconpath,
      Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightblue,
            borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          onTap: onTap,
          leading: ClipOval(
              child: Container(
                  height: 40,
                  width: 40,
                  color: AppColors.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(leadingiconPath!, fit: BoxFit.contain),
                  ))),
          title: Text(
            title ?? "",
            style: TextStyle(color: AppColors.whiteColor),
          ),
          trailing: Image.asset(
            trallingiconpath!,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget containerbox() {
    return Container(
      height: 150,
      width: sizeWidth(context) * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        image: DecorationImage(
            image: AssetImage(AppAssets.sportsmanImage), fit: BoxFit.cover),
      ),
    );
  }
}
