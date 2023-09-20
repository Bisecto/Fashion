import 'dart:io';

import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../res/app_colors.dart';

class AppUtils {

  // checkPermission(BuildContext context) async {
  //   var permission = await Geolocator.checkPermission();
  //   //Future<Position> getLocation = Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best,forceAndroidLocationManager: true, timeLimit: const Duration(seconds: 5));
  //
  //   // if (kDebugMode) {
  //   //   print("123456789123456782345678");
  //   //   print(getLocation);
  //   //   print("123456789123456782345678");
  //   //
  //   // }
  //   if (permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse) {
  //     //await SharedPref.putBool("isPermissionEnabled", false);
  //     //await SharedPref.putBool('acceptLocationUsage', true);
  //     Connectivity().checkConnection().then((connected) async {
  //       if (connected) {
  //         await openApp(context);
  //       } else {
  //         await openApp(context);
  //
  //         // AppNavigator.pushAndStackPage(context,
  //         //     page: NoInternet(
  //         //         callBack: () => AppNavigator.pushAndReplaceName(context,
  //         //             name: AppRouter.splashScreen),
  //         //         reInitApp: true));
  //       }
  //     });
  //   } else {
  //     //await SharedPref.putBool("isPermissionEnabled", false);
  //     //await SharedPref.putBool('acceptLocationUsage', false);
  //     Connectivity().checkConnection().then((connected) async {
  //       if (connected) {
  //         //await Geolocator.requestPermission();
  //         await openApp(context);
  //       } else {
  //         await openApp(context);
  //
  //         // AppNavigator.pushAndStackPage(context,
  //         //     page: NoInternet(
  //         //         callBack: () => AppNavigator.pushAndReplaceName(context,
  //         //             name: AppRouter.splashScreen),
  //         //         reInitApp: true));
  //       }
  //     });
  //   }
  // }
  //
  // openApp(context) async {
  //   bool firstOpen = (await SharedPref.getBool('firstOpen')) ?? false;
  //
  //  /// if (!firstOpen) {
  //     ///Check if user is logged in
  //     /// or take them to home page
  //     // Future.delayed(const Duration(seconds: 3), () {
  //     //   Navigator.pushReplacement(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //       builder: (BuildContext context) => const MobileLandingPage(),
  //     //     ),
  //     //   );
  //     //   Get.offAndToNamed(RouteStr.mobileLanding);
  //     // });
  //   ///} else {
  //     await SharedPref.putBool('firstOpen', true);
  //     if (Platform.isAndroid) {
  //       showDialog<AlertDialog>(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               actions: <Widget>[
  //                 Align(
  //                   alignment: Alignment.center,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       const Text(
  //                         'Allow BuyGas to Use your location',
  //                         style: TextStyle(
  //                             color: AppColors.green,
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       const Text(
  //                         'This app collects location data to enable you find and discover gas local vendors near you',
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.end,
  //                         children: [
  //                           TextButton(
  //                             child: const Text(
  //                               'Deny',
  //                               style: TextStyle(color: Colors.red),
  //                             ),
  //                             onPressed: () {
  //                               //Navigator.of(context).pop();
  //                               // Future.delayed(const Duration(seconds: 3), () {
  //                               AppNavigator.pushAndReplaceName(context,
  //                                   name: AppRouter.onBoardingScreen);
  //                               //Get.offAndToNamed(RouteStr.mobileLanding);
  //                               // });
  //                             },
  //                           ),
  //                           TextButton(
  //                             child: const Text(
  //                               'Accept',
  //                               style: TextStyle(color: Colors.green),
  //                             ),
  //                             onPressed: () async {
  //                               await getCurrentLocation();
  //                               // ignore: use_build_context_synchronously
  //                               AppNavigator.pushAndReplaceName(context,
  //                                   name: AppRouter.onBoardingScreen);
  //                             },
  //                           )
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             );
  //           });
  //     } else {
  //       Future.delayed(const Duration(seconds: 3), () {
  //         AppNavigator.pushAndReplaceName(context,
  //             name: AppRouter.onBoardingScreen);
  //       });
  //     }
  //  /// }
  // }


  static Size deviceScreenSize(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return queryData.size;
  }

  static String convertPrice(dynamic price, {bool showCurrency = false}) {
    double amount = price is String ? double.parse(price) : price;
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    return '${showCurrency ? 'NGN' : ''} ${formatCurrency.format(amount)}';
  }

  static DateTime timeToDateTime(TimeOfDay time, [DateTime? date]) {
    final newDate = date ?? DateTime.now();
    return DateTime(
        newDate.year, newDate.month, newDate.day, time.hour, time.minute);
  }

  static String formatComplexDate({required String dateTime}) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(dateTime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('d MMM y hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  static String formateSimpleDate({String? dateTime}) {
    var inputDate = DateTime.parse(dateTime!);

    var outputFormat = DateFormat('MMM d, hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  // static bool isPhoneNumber(String s) {
  //   if (s.length > 16 || s.length < 11) return false;
  //   return hasMatch(s, r'^(?:[+0][1-9])?[0-9]{10,12}$');
  // }

  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');
  static final timeFormat = DateFormat('hh:mm a');
  static final apiDateFormat = DateFormat('yyyy-MM-dd');
  static final utcTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  static final dayOfWeekFormat = DateFormat('EEEEE', 'en_US');
}
