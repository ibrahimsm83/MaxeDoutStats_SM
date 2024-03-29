// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateToRemovingAll(context, String routeName,
      {Object? arguments}) async {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static void navigateTo(BuildContext context, String routeName,
      {Object? arguments}) async {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateReplacementNamed(BuildContext context, String routeName,
      {Object? arguments}) async {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateCloseDialog(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
// class AppNavigation {
//   static Future<dynamic> showDialogGeneral(BuildContext context,
//       Widget dialogWidget, bool barrierDismissible) async {
//     try {
//       return await showGeneralDialog<dynamic>(
//         context: context,
//         barrierDismissible: barrierDismissible,
//         barrierLabel:
//             MaterialLocalizations.of(context).modalBarrierDismissLabel,
//         barrierColor: Colors.black38.withOpacity(0.90),
//         transitionDuration: const Duration(milliseconds: 200),
//         pageBuilder: (BuildContext buildcontext, Animation animamtion,
//             Animation secondaryAnimation) {
//           return Center(
//             child: dialogWidget,
//           );
//         },
//       );
//     } catch (e) {
//       print(e.toString());
//       throw Exception(e.toString());
//     }
//   }

//   static Future<void> navigateToRemoveingAll(context, Widget widget) async {
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (BuildContext context) => widget),
//         (Route<dynamic> route) => false);
//   }

//   static Future<dynamic> navigateTo(BuildContext context, Widget widget) async {
//     return Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//     );
//   }

//   static Future<void> navigateReplacement(
//       BuildContext context, Widget widget) async {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//     );
//   }

//   static void navigatorPop(BuildContext context) {
//     return Navigator.of(context).pop();
//   }

//   static void navigatorPopTrue(BuildContext context) {
//     return Navigator.of(context).pop(true);
//   }

//   static void navigatorPopFalse(BuildContext context) {
//     return Navigator.of(context).pop(false);
//   }

//   static void showToast({required String message}) {
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
// }
