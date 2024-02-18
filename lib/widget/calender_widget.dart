
// import 'package:maxedoutstats/utils/index_utils.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter/material.dart';


// class CalanderPage extends StatefulWidget {
//   const CalanderPage({Key? key}) : super(key: key);

//   @override
//   _CalanderPageState createState() => _CalanderPageState();
// }

// class _CalanderPageState extends State<CalanderPage> {
//   //final CalenderCtrl calenderCtrl = Get.put(CalenderCtrl());
//   var id = 1;
//   String key = "Litres";
//   double value = 1;
//   var userData;
//   //CalendarFormat _calendarFormat = CalendarFormat.month;
//   // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//   //     .toggledOn; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart = DateTime.now();
//   DateTime? _rangeEnd = DateTime.now();
//   bool sameday = true;
//   String mapDays(String day) {
//     switch (day) {
//       case 'Sun':
//         return 'S';
//       case 'Mon':
//         return 'M';
//       case 'Tue':
//         return 'T';
//       case 'Wed':
//         return 'W';
//       case 'Thu':
//         return 'T';
//       case 'Fri':
//         return 'F';
//       case 'Sat':
//         return 'S';
//       default:
//         return '';
//     }
//   }

//   @override
//   void initState() {
//    // var provider = Provider.of<UserProviderState>(context, listen: false);
//     //userData = provider.userdata[0];
//     //calenderCtrl.dataList = [];
//     //calenderCtrl.update();
//     // calenderCtrl.startDateCtr.text =
//     //     _rangeStart.toString().formater(Constants.YYYY_MM_dd);
//     // calenderCtrl.endDateCtr.text =
//     //     _rangeEnd.toString().formater(Constants.YYYY_MM_dd);
//     // calenderCtrl.getData(context, userData);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(AppAssets.backgroundImage),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: CustomeAppBar(
//           title: AppString.calendar,
//           actions: [
//             InkWell(
//               onTap: () => SharedFunctions.push(
//                   context, HistoryScreen(data: calenderCtrl.dataList)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 50,
//                   width: 45,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(
//                           AppAssets.moreIcon,
//                         ),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: GetBuilder<CalenderCtrl>(builder: (_) {
//             return Column(
//               children: [
//                 SizedBox(height: 3.h),
//                 tablecalender(),
//                 SizedBox(height: 2.h),
//                 CustomeButton(
//                     btnText: AppString.calculate,
//                     onTap: () {
//                       print(_rangeStart);
//                       print(_rangeEnd);
//                       if (_rangeStart != null && _rangeEnd != null) {
//                         calenderCtrl.startDateCtr.text = _rangeStart
//                             .toString()
//                             .formater(Constants.YYYY_MM_dd);
//                         calenderCtrl.endDateCtr.text =
//                             _rangeEnd.toString().formater(Constants.YYYY_MM_dd);
//                         calenderCtrl.getData(context, userData);
//                       } else {
//                         tostCall("Plaease select both dates.",
//                             Toast.LENGTH_LONG, ToastGravity.BOTTOM);
//                       }
//                     }),
//                 SizedBox(height: 2.h),
//                 // datebox(text1: "From Date", text2: "07:02:2022"),
//                 // datebox(text1: "To Date", text2: "07:02:2022"),
//                 // SizedBox(height: 2.h),
//                 calenderCtrl.dataList.length != 0 ? radio() : SizedBox(),
//                 SizedBox(height: 2.h),
//                 calenderCtrl.dataList.length != 0
//                     ? InkWell(
//                         onTap: () => SharedFunctions.push(context,
//                             StatePage(data: calenderCtrl.dataList[0].stats)),
//                         child: Column(
//                           children: [
//                             Text("Fuel Consume in $key",
//                                 style: TextStyle(
//                                     color: whiteColor, fontSize: 15.sp)),
//                             SizedBox(height: 0.5.h),
//                             Text(
//                                 (calenderCtrl.dataList[0].total[0].liters *
//                                             value)
//                                         .toStringAsFixed(1) +
//                                     " " +
//                                     key,
//                                 //value.toStringAsFixed(2).toString() + " " + key,
//                                 style: TextStyle(
//                                     color: whiteColor, fontSize: 15.sp)),
//                             // Text(value.toStringAsFixed(2).toString(),
//                             //         style: TextStyle(color: whiteColor),
//                             //         textScaleFactor: 1.5),
//                             SizedBox(height: 1.h),
//                             Text("Total Expenditure",
//                                 style: TextStyle(
//                                     color: whiteColor, fontSize: 15.sp)),
//                             SizedBox(height: 0.5.h),

//                             Text(
//                                 "\$" +
//                                     calenderCtrl.dataList[0].total[0].price
//                                         .toString(),
//                                 style: TextStyle(
//                                     color: whiteColor, fontSize: 15.sp)),
//                           ],
//                         ),
//                       )
//                     : SizedBox(),
//                 SizedBox(height: 2.h),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   Widget radio() {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         unselectedWidgetColor: Colors.white,
//       ),
//       child: Row(children: [
//         Radio(
//           activeColor: MaterialStateColor.resolveWith((states) => Colors.white),
//           value: 1,
//           groupValue: id,
//           onChanged: (val) {
//             setState(() {
//               print(val);
//               key = "Litres";
//               value = 1;
//               //var L = calenderCtrl.dataList[0].total[0].liters;
//               //print(L * value);
//               id = 1;
//             });
//           },
//         ),
//         const Text(
//           'In Litres',
//           style: TextStyle(fontSize: 16.0, color: Colors.white),
//         ),
//         Radio(
//           activeColor: MaterialStateColor.resolveWith((states) => Colors.white),
//           value: 2,
//           groupValue: id,
//           onChanged: (val) {
//             setState(() {
//               print(val);
//               key = "Gallons";
//               value = 0.264172;
//               //var L = calenderCtrl.dataList[0].total[0].liters;
//               //print(L + value);
//               calenderCtrl.update();
//               //print(calenderCtrl.dataList[0].total[0].liters);
//               id = 2;
//             });
//           },
//         ),
//         const Text(
//           'In Gallon',
//           style: TextStyle(fontSize: 16.0, color: Colors.white),
//         ),
//       ]),
//     );
//   }

//   Widget datebox({String? text1, String? text2}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.0),
//       child: Container(
//         height: 45,
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 text1!,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.sp,
//                     color: whiteColor),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 2.0),
//                   child: Text(
//                     text2!,
//                     style: TextStyle(fontSize: 14.sp, color: whiteColor),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget tablecalender() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Container(
//         color: Colors.black,
//         width: sizeWidth(context),
//         child: TableCalendar(
//           firstDay: kFirstDay,
//           lastDay: kLastDay,
//           focusedDay: _focusedDay,
//           selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//           rangeStartDay: _rangeStart,
//           rangeEndDay: _rangeEnd,
//           calendarFormat: _calendarFormat,
//           rangeSelectionMode: _rangeSelectionMode,
//           onDaySelected: (selectedDay, focusedDay) {
//             if (!isSameDay(_selectedDay, selectedDay)) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//                 _rangeStart = null; // Important to clean those
//                 _rangeEnd = null;
//                 _rangeSelectionMode = RangeSelectionMode.toggledOff;
//               });
//             }
//           },
//           onRangeSelected: (start, end, focusedDay) {
//             setState(() {
//               _selectedDay = null;
//               _focusedDay = focusedDay;
//               _rangeStart = start;
//               _rangeEnd = end;
//               _rangeSelectionMode = RangeSelectionMode.toggledOn;
//             });
//           },
//           onFormatChanged: (format) {
//             if (_calendarFormat != format) {
//               setState(() {
//                 _calendarFormat = format;
//               });
//             }
//           },
//           onPageChanged: (focusedDay) {
//             _focusedDay = focusedDay;
//           },
//           calendarStyle: CalendarStyle(
//             defaultTextStyle: const TextStyle(color: whiteColor, fontSize: 18),
//             todayTextStyle: const TextStyle(fontSize: 18, color: whiteColor),
//             todayDecoration: BoxDecoration(
//                 color: sameday ? primaryColor : Colors.transparent,
//                 shape: BoxShape.circle),
//             selectedDecoration: const BoxDecoration(
//                 color: primaryColor, shape: BoxShape.circle),
//             selectedTextStyle:
//                 const TextStyle(color: Colors.blue, fontSize: 18),
//             weekendTextStyle: const TextStyle(color: whiteColor, fontSize: 18),
//             outsideDaysVisible: false,
//           ),
//           headerStyle: HeaderStyle(
//             decoration: const BoxDecoration(color: secondaryColor),
//             leftChevronIcon: const Icon(
//               Icons.chevron_left,
//               color: Colors.white,
//             ),
//             rightChevronIcon: const Icon(
//               Icons.chevron_right,
//               color: Colors.white,
//             ),
//             formatButtonVisible: false,
//             titleCentered: true,
//             titleTextStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.sp,
//                 color: whiteColor),
//           ),
//           calendarBuilders: CalendarBuilders(
//             dowBuilder: (context, day) {
//               final text = DateFormat.E().format(day);
//               return Center(
//                 child: Text(
//                   mapDays(text),
//                   style: TextStyle(color: whiteColor, fontSize: 15.sp),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
