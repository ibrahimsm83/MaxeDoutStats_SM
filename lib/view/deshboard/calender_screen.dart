import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPageView extends StatefulWidget {
  const CalenderPageView({Key? key}) : super(key: key);

  @override
  State<CalenderPageView> createState() => _CalenderPageViewState();
}

class _CalenderPageViewState extends State<CalenderPageView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart = DateTime.now();
  DateTime? _rangeEnd = DateTime.now();
  bool sameday = true;
  String mapDays(String day) {
    switch (day) {
      case 'Sun':
        return 'S';
      case 'Mon':
        return 'M';
      case 'Tue':
        return 'T';
      case 'Wed':
        return 'W';
      case 'Thu':
        return 'T';
      case 'Fri':
        return 'F';
      case 'Sat':
        return 'S';
      default:
        return '';
    }
  }

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
                : 12.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.darkbalue,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0)),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                calendarFormat: _calendarFormat,
                //headerVisible: true,
                calendarStyle: const CalendarStyle(
                  defaultTextStyle:
                      TextStyle(color: AppColors.whiteColor, fontSize: 18),
                  todayTextStyle:
                      TextStyle(fontSize: 18, color: AppColors.whiteColor),
                  todayDecoration: BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  // selectedTextStyle:
                  //      TextStyle(color: Colors.blue, fontSize: 18),
                  weekendTextStyle:
                      TextStyle(color: AppColors.whiteColor, fontSize: 18),
                  // holidayTextStyle: TextStyle(color: AppColors.whiteColor),
    
                  // rowDecoration: BoxDecoration(
                  //   color: AppColors.whiteColor
                  // ),
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: AppColors.whiteColor),
                  weekendStyle: TextStyle(color: AppColors.whiteColor),
                ),
                headerStyle: HeaderStyle(
                  decoration: const BoxDecoration(
                    color: AppColors.lightblack,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  leftChevronIcon: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
          _buildlistWidget(),
           _buildlistWidget(),
            _buildlistWidget(),
            SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildlistWidget() {
    return InkWell(
      onTap: (){
         AppNavigation.navigateTo(context, Routes.dayOneProgramRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.lightblue,
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Container(
                            height: 15,
                            width: 15,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                         Text(
                          "Arms Workout",
                          style: TextStyle(
                            fontSize: 12.sp,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Text(
                      "5 Feb",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deadlift",
                        style:
                            TextStyle(color: AppColors.whiteColor, fontSize: 10.sp),
                      ),
                      const Text(
                        "6 Exercise",
                        style: TextStyle(
                            color: AppColors.whiteColor
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Triceps ",
                        style:
                            TextStyle(color: AppColors.whiteColor, fontSize: 10.sp),
                      ),
                      Text(
                        "5 Exercise",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
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
